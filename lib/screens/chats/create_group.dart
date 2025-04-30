import 'package:chat_app/custom_ui/contact_card.dart';
import 'package:chat_app/custom_ui/group_card.dart';
import 'package:chat_app/data/contact_data.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _SelectContactState();
}

class _SelectContactState extends State<CreateGroup> {
  final data = ContactData();
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text("Add Partipants", style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26))],
      ),
      //BODY
      body: Stack(
        children: [
          ListView.builder(
            itemCount: data.contactData.length,
            itemBuilder: (context, index) {
              //skipping first element, to hold room for groupsContainer
              if (index == 0) {
                return Container(height: groups.isNotEmpty ? 90 : 10);
              }
              return InkWell(
                onTap: () {
                  //now using the first element, with new index
                  if (data.contactData[index - 1].select == false) {
                    setState(() {
                      data.contactData[index - 1].select = true;
                      groups.add(data.contactData[index - 1]);
                    });
                  } else {
                    setState(() {
                      data.contactData[index - 1].select = false;
                      groups.remove(data.contactData[index - 1]);
                    });
                  }
                },
                child: ContactCard(contact: data.contactData[index - 1]),
              );
            },
          ),
          groups.isNotEmpty
              ? Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.contactData.length,
                      itemBuilder: (context, index) {
                        if (data.contactData[index].select == true) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                data.contactData[index].select = false;
                                groups.remove(data.contactData[index]);
                              });
                            },
                            child: GroupCard(contact: data.contactData[index]),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.blueGrey),
                ],
              )
              : Container(),
        ],
      ),
    );
  }
}
