import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;

  const CustomCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => IndividualPage(chatModel: chatModel,),
        ));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel.isGroup?
                "assets/groups.svg" : "assets/person.svg",
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                height: 38,
                width: 37,
              ),
            ),
            title: Text(chatModel.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [Icon(Icons.done_all), SizedBox(width: 3), Text(chatModel.currentMessage, style: TextStyle(fontSize: 13))],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
