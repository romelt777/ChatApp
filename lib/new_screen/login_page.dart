import 'package:chat_app/widgets/login/country_card.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            wordSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),

      //BODY
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "WhatsApp will send an SMS message to verify your number",
              style: TextStyle(fontSize: 14.5),
            ),
            SizedBox(height: 5),
            Text("What's my number?", style: TextStyle(fontSize: 12.5, color: Colors.cyan[800])),
            SizedBox(height: 15),
            CountryCard(),
          ],
        ),
      ),
    );
  }
}
