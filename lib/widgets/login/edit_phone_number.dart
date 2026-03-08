import 'package:chat_app/new_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/model/country_model.dart';

Future<void> editPhoneNumber(
  BuildContext context,
  CountryModel country,
  TextEditingController controller,
  FocusNode focusNode,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We will be verifying your phone number",
                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10),
              Text(
                "${country.code} ${controller.text}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                "Is this OK, or would you like to edit the number?",
                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Edit"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, "ok");
              Navigator.push(context, MaterialPageRoute(builder: (builder) => OtpScreen()));
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
  // if (result == "ok") {
  //   focusNode.unfocus();
  // }
}
