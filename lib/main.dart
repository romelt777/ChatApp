import 'package:camera/camera.dart';
import 'package:chat_app/new_screen/landing_screen.dart';
import 'package:chat_app/screens/cameras/camera_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //make sure flutter is finished setting up
  WidgetsFlutterBinding.ensureInitialized();

  //connecting app to firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //scans device for cameras, wait until finished finding cameras
  cameras = await availableCameras();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: const Color(0xFF075E54),
        //appBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarThemeData(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF128C7E)),
      ),
      home: LoginScreen(),
    );
  }
}
