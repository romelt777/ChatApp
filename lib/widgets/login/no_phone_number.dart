import 'package:flutter/material.dart';
import 'package:chat_app/model/country_model.dart';

Future<void> noPhoneNumber(
  BuildContext context,
  CountryModel country,
  TextEditingController controller,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("There is no number you entered")],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
