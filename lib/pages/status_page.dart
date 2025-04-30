import 'dart:ffi';

import 'package:chat_app/custom_ui/status/status_others.dart';
import 'package:chat_app/custom_ui/status/status_self.dart';
import 'package:chat_app/data/status_data.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  var data = StatusData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 48,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              child: Icon(Icons.edit, color: Colors.blueGrey[900]),
            ),
          ),
          SizedBox(height: 13),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StatusSelf(),
            label("Recent Updates"),
            ListView.builder(
              //shrinkwrap = False => take as much space as it can
              //shrinkwrap = True => take as much space as needed for content
              shrinkWrap: true,
              itemCount: data.statuses.length - 3,
              itemBuilder: (context, index) {
                return StatusOthers(
                  name: data.statuses[index].name,
                  time: data.statuses[index].time,
                  imageName: data.statuses[index].imageName,
                );
              },
            ),
            label("Viewed Updates"),
            ListView.builder(
              //shrinkwrap = False => take as much space as it can
              //shrinkwrap = True => take as much space as needed for content
              shrinkWrap: true,
              itemCount: data.statuses.length - (data.statuses.length - 3),
              itemBuilder: (context, index) {
                return StatusOthers(
                  name: data.statuses[index + 4].name,
                  time: data.statuses[index + 4].time,
                  imageName: data.statuses[index + 4].imageName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(labelName, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
