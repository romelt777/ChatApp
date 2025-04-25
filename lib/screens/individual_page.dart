import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualPage({super.key, required this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  widget.chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
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
    );
  }
}
