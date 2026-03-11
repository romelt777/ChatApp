import 'dart:io';

import 'package:flutter/material.dart';

class FileReply extends StatelessWidget {
  final String? message;
  final String time;
  final String path;

  const FileReply({super.key, this.message, required this.time, required this.path});

  @override
  Widget build(BuildContext context) {
    final String? messageUI = message;

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2.8,
            width: MediaQuery.of(context).size.width / 1.8,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.file(
                  File(path),
                  fit: BoxFit.cover,
                ),
                if (messageUI != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black45,
                      padding: EdgeInsets.all(6),
                      child: Text(
                        messageUI,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
