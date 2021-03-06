// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kbc_app/services/auth.dart';
import 'package:kbc_app/views/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();

    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(
          Text(connected ? "CONNECTED TO INTERNET" : "NO INTERNET"),
          background: Colors.green);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.withOpacity(0.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/kbc5.png",
              height: 220,
              width: 220,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Welcome To",
              style: GoogleFonts.acme(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Money Maker Quizzes",
              style: GoogleFonts.acme(
                  color: Colors.greenAccent,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            SignInButton(Buttons.GoogleDark, onPressed: () async {
              await signWithGoogle();

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
