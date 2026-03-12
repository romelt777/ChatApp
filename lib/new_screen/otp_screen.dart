import 'package:chat_app/model/country_model.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/widgets/otp/otp_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  final CountryModel country;
  final String verificationId;

  const OtpScreen({
    super.key,
    required this.number,
    required this.country,
    required this.verificationId,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthClass authClass = AuthClass();
  String smsCode = "";

  //for UI OTP
  bool showResult = false;
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Verify ${widget.country.code} ${widget.number}",
          style: TextStyle(color: Colors.teal[800], fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),

      //BODY
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "We have sent an SMS with a code to",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: " ${widget.country.code} ${widget.number}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " Wrong number?",
                    style: TextStyle(
                      color: Colors.cyan[800],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.teal,
              focusedBorderColor: Colors.teal,
              showFieldAsBox: false,
              textStyle: TextStyle(fontSize: 44),
              borderWidth: 4.0,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                if (showResult) {
                  setState(() {
                    showResult = false;
                  });
                }
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                bool success = await authClass.signInWithPhoneNumber(
                  widget.verificationId,
                  verificationCode,
                  context,
                );

                setState(() {
                  isSuccess = success;
                  showResult = true;
                });

                if (context.mounted) {
                  FocusScope.of(context).unfocus();
                }

                //navigate to main page.
                if (context.mounted && isSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => HomeScreen()),
                    (route) => false,
                  );
                }
              },
            ),
            SizedBox(height: 15),
            if (showResult)
              Text(
                isSuccess ? "Code verified!" : "Wrong code, try again",
                style: TextStyle(
                  color: isSuccess ? Colors.green[600] : Colors.red[600],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              SizedBox(height: 19), // holds the space so layout doesn't jump
            SizedBox(height: 45),
            Text(
              "Enter 6-digit code",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 45),
            OtpButton(text: "Resend SMS", icon: Icons.message),
            SizedBox(height: 15),
            Divider(thickness: 1.5, color: Colors.grey.withValues(alpha: 0.3)),
            SizedBox(height: 15),
            OtpButton(text: "Call Me", icon: Icons.phone),
          ],
        ),
      ),
    );
  }
}
