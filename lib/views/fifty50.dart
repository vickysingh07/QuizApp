// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

class Fifty50 extends StatefulWidget {
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  Fifty50(
      {required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  _Fifty50State createState() => _Fifty50State();
}

class _Fifty50State extends State<Fifty50> {
  late String WrongOpt1;
  late String WrongOpt2;
  List WrongOption = [];

  final player = AudioCache();
  playLock() async {
    final player = AudioCache();
    player.play("audio_effects/LIFELINEE.mp3");
  }

  fetchWrongOptons() {
    setState(() {
      if (widget.opt1 != widget.correctAns) {
        WrongOption.add(widget.opt1);
      }
      if (widget.opt2 != widget.correctAns) {
        WrongOption.add(widget.opt2);
      }

      if (widget.opt3 != widget.correctAns) {
        WrongOption.add(widget.opt3);
      }
      if (widget.opt4 != widget.correctAns) {
        WrongOption.add(widget.opt4);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWrongOptons();
    playLock();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 200),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FIFTY 50 LIFELINE",
                style: GoogleFonts.alice(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "'${WrongOption[0]}' AND '${WrongOption[1]}' are INCORRECT OPTIONS.",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.cyanAccent.withOpacity(0.8),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "You Will Be Automatically Redirected To Quiz Screen In 10 Seconds.",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
