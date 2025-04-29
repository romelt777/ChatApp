import 'package:flutter/material.dart';

class MessageReply extends StatelessWidget {
  const MessageReply({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffffffff),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 60, top: 10, bottom: 25),
                child: Text("yes it is", style: TextStyle(fontSize: 16)),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text("20:07", style: TextStyle(fontSize: 13, color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
