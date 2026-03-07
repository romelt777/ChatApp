import 'package:chat_app/data/country_data.dart';
import 'package:chat_app/model/country_model.dart';
import 'package:chat_app/widgets/login/country_card.dart';
import 'package:chat_app/widgets/login/number_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CountryModel country = CountryData().countries.firstWhere((c) => c.name == "Canada");

  void setCountryData(CountryModel country) {
    setState(() {
      this.country = country;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialogue() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text("Keep going Romel"),
                Text("YES, lets go!"),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {}, child: Text("Edit")),
          ],
        );
      },
    );
  }

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
      body: SizedBox(
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
            CountryCard(
              country: country,
              setCountryData: setCountryData,
            ),
            SizedBox(height: 15),
            NumberWidget(
              country: country,
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                showMyDialogue();
              },
              child: Container(
                color: Colors.tealAccent,
                height: 40,
                width: 70,
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
