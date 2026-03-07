import 'package:chat_app/model/country_model.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final CountryModel country;
  final TextEditingController controller;

  const NumberWidget({super.key, required this.country, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 1.5,
      height: 40,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "+",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  country.code.substring(1),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
            ),
            width: (MediaQuery.of(context).size.width / 1.5) - 100,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: "phone number",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
