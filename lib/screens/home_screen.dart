import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//needs ticker for animations
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _controller; //assign later
  @override
  void initState() {
    //runs once when widget is created
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Clone"),
        actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        PopupMenuButton<String>(
          onSelected: (value) =>{
            print(value)
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(value: "New Group",child: Text("New Group")),
              PopupMenuItem(value: "New Broadcast",child: Text("New Broadcast")),
              PopupMenuItem(value: "WhatsApp Web",child: Text("WhatsApp Web")),
              PopupMenuItem(value: "Starred Message",child: Text("Starred Message")),
              PopupMenuItem(value: "Settings",child: Text("Settings")),
            ];
          },
        ),
        ],
        bottom: TabBar(
        controller: _controller,
        tabs: [Tab(icon: Icon(Icons.camera_alt)), Tab(text: "CHATS"), Tab(text: "STATUS"), Tab(text: "CALLS")],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [Text("Camera"), Text("Chats"), Text("Status"), Text("Calls")],
      ),
    );
  }
}
