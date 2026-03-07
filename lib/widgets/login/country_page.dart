import 'package:chat_app/data/country_data.dart';
import 'package:chat_app/widgets/login/country_card_list.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  final Function setCountryData;

  const CountryPage({super.key, required this.setCountryData});

  @override
  Widget build(BuildContext context) {
    final data = CountryData();

    return Scaffold(
      //APPBAR
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
        title: Text(
          "Choose a country",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w600,
            fontSize: 22,
            wordSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.teal,
            ),
            onPressed: () {},
          ),
        ],
      ),

      //BODY
      body: ListView.builder(
        itemCount: data.countries.length,
        itemBuilder:
            (context, index) => CountryCardList(
              country: data.countries[index],
              setCountryData: setCountryData,
            ),
      ),
    );
  }
}
