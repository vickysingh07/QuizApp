import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kbc_app/services/auth.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Colors.lime.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/kbc4.png",
              height: 270,
              width: 280,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to KBC",
              style: GoogleFonts.acme(
                  color: Colors.black,
                  fontSize: 31,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 13,
            ),
            SignInButton(Buttons.GoogleDark, onPressed: () async {
              await signWithGoogle();
            }),
          ],
        ),
      ),
    );
  }
}
