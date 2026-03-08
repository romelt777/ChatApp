import 'package:chat_app/model/country_model.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  final CountryModel country;

  const OtpScreen({super.key, required this.number, required this.country});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
