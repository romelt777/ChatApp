import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/widgets/chats/app_bar_chats.dart';
import 'package:chat_app/widgets/chats/chat_controls.dart';
import 'package:chat_app/widgets/chats/message_list.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _connect();
    _setupFocusNodeListener();
  }

  void _setupFocusNodeListener() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          // Hide emoji keyboard when text field gets focus
          _showEmoji = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _toggleEmojiKeyboard() {
    setState(() {
      _focusNode.unfocus();
      _focusNode.canRequestFocus = false;
      _showEmoji = !_showEmoji;
    });
  }

  void _connect() {
    socket = IO.io("http://192.168.2.218:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("/test", "Hello Rom");
    socket.onConnect((data) => print("Connected from flutter"));
    print(socket.connected);
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
            child: Stack(
              children: [
                MessageList(),
                ChatControls(
                  controller: _controller,
                  focusNode: _focusNode,
                  showEmoji: _showEmoji,
                  onEmojiToggle: _toggleEmojiKeyboard,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
