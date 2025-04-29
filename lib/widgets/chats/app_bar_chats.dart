// File: widgets/chat_app_bar.dart
import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarChat extends StatelessWidget implements PreferredSizeWidget {
  final ChatModel chatModel;

  const AppBarChat({super.key, required this.chatModel});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      titleSpacing: 0,
      leading: _buildLeadingButton(context),
      title: _buildTitle(),
      actions: _buildActions(context),
    );
  }

  Widget _buildLeadingButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back, size: 24),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blueGrey,
            child: SvgPicture.asset(
              chatModel.isGroup ?? false ? "assets/groups.svg" : "assets/person.svg",
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              height: 38,
              width: 37,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(chatModel.name, style: const TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold)),
            const Text("last seen today at 12:05", style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
      _buildPopupMenu(),
    ];
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<String>(
      onSelected: (value) => {print(value)},
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(value: "View Contact", child: Text("View Contact")),
          const PopupMenuItem(value: "Media, Links, and Docs", child: Text("Media, Links, and Docs")),
          const PopupMenuItem(value: "WhatsApp Web", child: Text("WhatsApp Web")),
          const PopupMenuItem(value: "Search", child: Text("Search")),
          const PopupMenuItem(value: "Mute Notification", child: Text("Mute Notification")),
          const PopupMenuItem(value: "Wallpaper", child: Text("Wallpaper")),
        ];
      },
    );
  }
}
