import 'package:chat_app/custom_ui/button_card.dart';
import 'package:chat_app/data/chat_no_groups_data.dart';
import 'package:chat_app/screens/home_screen.dart';
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomeScreen()));
                setState(() {
                  currentUser = data.chatNoGroups.removeAt(index);
                });
              },
              child: ButtonCard(icon: Icons.person, name: data.chatNoGroups[index].name),
            ),
      ),
    );
  }
}
