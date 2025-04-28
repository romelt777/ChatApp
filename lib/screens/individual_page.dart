import 'package:chat_app/model/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//
import 'package:flutter/services.dart';

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

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //APPBAR
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  //if null, will become false
                  widget.chatModel.isGroup ?? false ? "assets/groups.svg" : "assets/person.svg",
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 38,
                  width: 37,
                ),
              ),
            ],
          ),
        ),
        //TITLE
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name, style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold)),
                Text("last seen today at 12:05", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ),
        //right appBar buttons
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
            onSelected: (value) => {print(value)},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "View Contact", child: Text("View Contact")),
                PopupMenuItem(value: "Media, Links, and Docs", child: Text("Media, Links, and Docs")),
                PopupMenuItem(value: "WhatsApp Web", child: Text("WhatsApp Web")),
                PopupMenuItem(value: "Search", child: Text("Search")),
                PopupMenuItem(value: "Mute Notification", child: Text("Mute Notification")),
                PopupMenuItem(value: "Wallpaper", child: Text("Wallpaper")),
              ];
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [ListView(), chatControls()]),
      ),
    );
  }

  //BOTTOM KEYBOARD
  Widget chatControls() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SafeArea(
            bottom: !_showEmoji,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Card(
                    margin: EdgeInsets.only(left: 2, right: 2, bottom: 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    //TEXT FORM FIELD
                    child: TextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type a message",
                        //EMOJI BUTTON
                        prefixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              //folding keyboard if open.
                              _focusNode.unfocus();
                              _focusNode.canRequestFocus = false;
                              //toggle emoji keyboard
                              _showEmoji = !_showEmoji;
                            });
                          },
                          icon: Icon(Icons.emoji_emotions_outlined),
                        ),
                        contentPadding: EdgeInsets.all(5),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (builder) => bottomSheet(),
                                );
                              },
                              icon: Icon(Icons.attach_file),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFF128C7E),
                  radius: 25,
                  child: IconButton(icon: Icon(Icons.mic, color: Colors.white), onPressed: () {}),
                ),
              ],
            ),
          ),
          _showEmoji ? emojiSelect(context) : Container(),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(width: 40),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(width: 40),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(width: 40),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(width: 40),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(backgroundColor: color, radius: 30, child: Icon(icon, size: 29, color: Colors.white)),
          SizedBox(height: 5),
          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget emojiSelect(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        },
        config: Config(emojiViewConfig: EmojiViewConfig(columns: 7)),
      ),
    );
  }
}
