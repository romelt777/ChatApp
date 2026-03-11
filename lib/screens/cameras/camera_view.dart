import 'dart:io';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final String path;
  final Function? onImageSend;

  const CameraView({
    super.key,
    required this.path,
    this.onImageSend,
  });

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  bool _keyboardOpened = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _keyboardOpened = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //APPBAR
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop_rotate, size: 27)),
          IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined, size: 27)),
          IconButton(onPressed: () {}, icon: Icon(Icons.title, size: 27)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 27)),
        ],
      ),
      //BODY
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //MEDIA: VIDEO
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: Image.file(File(widget.path), fit: BoxFit.cover),
            ),
            Positioned(
              bottom: _keyboardOpened ? 0 : 70,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                //FORM FOR ADDING CAPTIONS
                child: TextFormField(
                  focusNode: _focusNode,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.add_photo_alternate, color: Colors.white, size: 27),
                    hintText: "Add Caption...",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (widget.onImageSend != null) {
                          widget.onImageSend!.call(widget.path);
                        } else {}
                      },
                      child: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.teal[700],
                        child: Icon(Icons.check, color: Colors.white, size: 27),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
