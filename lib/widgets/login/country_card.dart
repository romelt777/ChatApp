import 'package:chat_app/widgets/login/country_page.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder) => CountryPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
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
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    "Philippines",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
