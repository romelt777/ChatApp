import 'package:chat_app/data/country_data.dart';
import 'package:chat_app/model/country_model.dart';
import 'package:chat_app/widgets/login/country_selector.dart';
import 'package:chat_app/widgets/login/edit_phone_number.dart';
import 'package:chat_app/widgets/login/no_phone_number.dart';
import 'package:chat_app/widgets/login/number_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller for number widget
  TextEditingController _controller = TextEditingController();

  //focus node for folding keyboard
  final FocusNode _focusNode = FocusNode();

  CountryModel country = CountryData().countries.firstWhere((c) => c.name == "Canada");

  void setCountryData(CountryModel country) {
    setState(() {
      this.country = country;
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              CountrySelector(
                country: country,
                setCountryData: setCountryData,
              ),
              SizedBox(height: 15),
              NumberWidget(
                country: country,
                controller: _controller,
                focusNode: _focusNode,
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  if (_controller.text.isEmpty) {
                    noPhoneNumber(context, country, _controller);
                  } else {
                    editPhoneNumber(context, country, _controller, _focusNode);
                  }
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
      ),
    );
  }
}
