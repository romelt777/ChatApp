import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
    const Homescreen({super.key});

    @override
    State<Homescreen> createState() => _HomescreenState();
}

//needs ticker for animations
class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{
    late TabController _controller; //assign later
    @override
    void initState() { //runs once when widget is created
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
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                ],
                bottom: TabBar(
                    controller: _controller,
                    tabs: [
                        Tab(icon: Icon(Icons.camera_alt)),
                        Tab(text: "CHATS"),
                        Tab(text: "STATUS"),
                        Tab(text: "CALLS"),                                
                    ]
                ),
            ),
            body:TabBarView(
                controller: _controller,
                children: [
                    Text("Camera"),
                    Text("Chats"),
                    Text("Status"),
                    Text("Calls"),
                ],
            ),  
        );
    }
}
