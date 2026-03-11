import 'package:chat_app/custom_ui/file_reply.dart';
import 'package:chat_app/custom_ui/file_self.dart';
import 'package:chat_app/data/messages_data.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/cameras/camera_view.dart';
import 'package:chat_app/utils/globals.dart';
import 'package:chat_app/widgets/chats/app_bar_chats.dart';
import 'package:chat_app/widgets/chats/chat_controls.dart';
import 'package:chat_app/widgets/chats/message_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualPage({super.key, required this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool _showEmoji = false; // to show emoji keyboard
  FocusNode _focusNode = FocusNode(); //for show/hide keyboard
  TextEditingController _controller = TextEditingController();
  late IO.Socket socket; //io socket
  bool _showSendButton = false;
  ScrollController scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker(); //for gallery image picker
  XFile? file; // cross platform file

  @override
  void initState() {
    super.initState();
    _connect();
    _setupFocusNodeListener();
    _setUpMessageListener();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _setUpMessageListener() {
    MessagesData().addListener(_onNewMessage);
  }

  //refresh UI
  void _onNewMessage() {
    if (!mounted) return;
    setState(() {});
    _scrollToBottom();
  }

  void _setupFocusNodeListener() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          // Hide emoji keyboard when text field gets focus
          _showEmoji = false;
        });
        //move message up when keyboard opens
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Future.delayed(Duration(milliseconds: 700), () {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    MessagesData().removeListener(_onNewMessage);
    scrollController.dispose();
    super.dispose();
  }

  void _toggleEmojiKeyboard() {
    setState(() {
      _focusNode.unfocus();
      _focusNode.canRequestFocus = false;
      _showEmoji = !_showEmoji;
    });
  }

  void _changeSendMicButton() {
    setState(() {
      _showSendButton = !_showSendButton;
    });
  }

  void _updateSendButtonState(String value) {
    setState(() {
      _showSendButton = value.trim().isNotEmpty;
    });
  }

  void _scrollToBottom() {
    //Wait until the current frame (build phase) finishes
    if (scrollController.hasClients && scrollController.position.hasContentDimensions) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  // MESSAGES----------------------------------------------->

  void _connect() {
    //using localHost
    socket = IO.io("http://10.0.2.2:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();
    socket.emit("signin", currentUser?.id);
    //receiving message
    socket.onConnect((data) {
      socket.off("message");
      print("Connected from flutter");
      socket.on("message", (msg) {
        print(msg);
        MessagesData().setMessage("destination", msg["message"], msg["time"], msg["path"]);
      });
    });
  }

  //outgoing message
  void sendMessage(String message, int? sourceId, int targetId, String? path) {
    MessagesData().setMessage("source", message, DateTime.now().toString().substring(10, 16), path);
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "time": DateTime.now().toString().substring(10, 16),
      "path": path,
    });
    _scrollToBottom();
  }

  // <-----------------------------------------------MESSAGES

  //for gallery images button
  Future<void> pickImage() async {
    final result = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = result;
    });
    if (mounted && file != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (builder) => CameraView(
                path: file!.path,
                onImageSend: onImageSend,
              ),
        ),
      );
    }
  }

  // //method for the camera, to add image to message
  void onImageSend(String path) {
    print("HELLO I AM WORKING: $path");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whatsAppBackground.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          //APPBAR
          appBar: AppBarChat(chatModel: widget.chatModel),
          resizeToAvoidBottomInset: true,
          //BODY
          body: SizedBox(
            height: MediaQuery.of(context).size.height - 175,
            width: MediaQuery.of(context).size.width,
            child: PopScope(
              child: Column(
                children: [
                  MessageList(scrollController: scrollController),
                  ChatControls(
                    controller: _controller,
                    focusNode: _focusNode,
                    showEmoji: _showEmoji,
                    onEmojiToggle: _toggleEmojiKeyboard,
                    showSendButton: _showSendButton,
                    changeSendMicButton: _changeSendMicButton,
                    sendButtonToggle: _updateSendButtonState,
                    sendMessage: sendMessage,
                    targetId: widget.chatModel.id,
                    scrollController: scrollController,
                    picker: _picker,
                    file: file,
                    pickImage: pickImage,
                    onImageSend: onImageSend,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
