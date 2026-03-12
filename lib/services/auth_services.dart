import 'package:chat_app/model/country_model.dart';
import 'package:chat_app/new_screen/otp_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //steps:
  //1. user enters phone number,
  //2. call verifyPhoneNumber,
  //3. firebase sends otp
  //4. codesent returns verificationId
  //5. store the verificationId

  //verifying phone number
  Future<void> verifyPhoneNumber(
    String phoneNumber,
    BuildContext context,
    CountryModel country,
  ) async {
    //this function runs when phone verification is success
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      print("success");
    }

    //function runs if verification fails
    verificationFailed(FirebaseAuthException exception) {
      print("fail");
    }

    //runs after code is sent.
    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingtoken]) {
              print("code Sent");
              if (context.mounted) {
                Navigator.pop(context, "ok");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (builder) => OtpScreen(
                          number: phoneNumber,
                          country: country,
                          verificationId: verificationId,
                        ),
                  ),
                );
              }
            }
            as PhoneCodeSent;

    //runs when time for the code has expired. only runs if success/fail do not run
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {};

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //NEXT STEPS
  //6. user enters otp
  //7. call signInWithPhoneNumber (aka signInWithCredential)

  //after verifying sign in,
  Future<void> signInWithPhoneNumber(
    String verificationId,
    String smsCode,
    BuildContext context,
  ) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      print(verificationId);
      print(smsCode);

      // UserCredential userCredential = await _auth.signInWithCredential(credential);

      //navigate to main page.
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => LoginScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
