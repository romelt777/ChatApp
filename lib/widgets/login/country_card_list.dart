import 'package:chat_app/model/country_model.dart';
import 'package:flutter/material.dart';

class CountryCardList extends StatelessWidget {
  final CountryModel country;

  const CountryCardList({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0.15),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Text(country.flag),
            SizedBox(
              width: 15,
            ),
            Text(country.name),
            Expanded(
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(country.code)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
