import 'dart:io';

import 'package:flutter/material.dart';

class FileSelf extends StatelessWidget {
  final String path;

  const FileSelf({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    print(path);

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.8,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[300],
          ),

          //IMAGE CARD
          child: Card(
            margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.file(File(path)),
          ),
        ),
      ),
    );
  }
}
