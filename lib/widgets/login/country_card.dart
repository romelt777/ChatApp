import 'package:chat_app/model/country_model.dart';
import 'package:chat_app/widgets/login/country_page.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final Function setCountryData;
  final CountryModel country;

  const CountryCard({super.key, required this.setCountryData, required this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (builder) => CountryPage(
                  setCountryData: setCountryData,
                ),
          ),
        );
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
              child: SizedBox(
                child: Center(
                  child: Text(
                    country.name,
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
