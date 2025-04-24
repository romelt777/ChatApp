import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        //appBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF128C7E),
        ),
      ),
      home: Homescreen(),
  
    );
  }
}
