import 'package:chat_app/customui/button_card.dart';
import 'package:chat_app/data/chat_no_groups_data.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/cameras/home_screen.dart';
import 'package:chat_app/utils/globals.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var data = ChatNoGroupsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.chatNoGroups.length,
        itemBuilder:
            (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentUser = data.chatNoGroups.removeAt(index);
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomeScreen()));
              },
              child: ButtonCard(icon: Icons.person, name: data.chatNoGroups[index].name),
            ),
      ),
    );
  }
}
