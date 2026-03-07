import 'package:chat_app/model/country_model.dart';
import 'package:flutter/material.dart';

class CountryCardList extends StatefulWidget {
  final CountryModel country;
  final Function setCountryData;

  const CountryCardList({super.key, required this.country, required this.setCountryData});

  @override
  State<CountryCardList> createState() => _CountryCardListState();
}

class _CountryCardListState extends State<CountryCardList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.setCountryData(widget.country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(widget.country.flag),
              SizedBox(
                width: 15,
              ),
              Text(widget.country.name),
              Expanded(
                child: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text(widget.country.code)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
