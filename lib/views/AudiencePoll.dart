// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

class AudiencePoll extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  AudiencePoll(
      {required this.question,
      required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  _AudiencePollState createState() => _AudiencePollState();
}

class _AudiencePollState extends State<AudiencePoll> {
  @override
  void initState() {
    super.initState();
    VotingMachine();
    playLock();
  }

  final player = AudioCache();
  playLock() async {
    final player = AudioCache();
    player.play("audio_effects/LIFELINEE.mp3");
  }

  int opt1Votes = 0;
  int opt2Votes = 0;
  int opt3Votes = 0;
  int opt4Votes = 0;
  bool isVoting = true;
  VotingMachine() {
    Future.delayed(Duration(seconds: 7), () {
      setState(() {
        if (widget.opt1 == widget.correctAns) {
          opt1Votes = Random().nextInt(100);
        } else {
          opt1Votes = Random().nextInt(40);
        }

        if (widget.opt2 == widget.correctAns) {
          opt2Votes = Random().nextInt(100);
        } else {
          opt2Votes = Random().nextInt(40);
        }

        if (widget.opt3 == widget.correctAns) {
          opt3Votes = Random().nextInt(100);
        } else {
          opt3Votes = Random().nextInt(40);
        }

        if (widget.opt4 == widget.correctAns) {
          opt4Votes = Random().nextInt(100);
        } else {
          opt4Votes = Random().nextInt(40);
        }
        isVoting = false;
      });

      Future.delayed(Duration(seconds: 7), () {
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Audience Poll Lifeline",
                style: GoogleFonts.alice(
                    color: Colors.lightGreenAccent,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 55,
              ),
              Text("Question  - ${widget.question}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 15,
              ),
              Text(isVoting ? "Audience is Voting" : "Here are the Results",
                  style: GoogleFonts.alike(
                      color: Colors.lightGreenAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 10,
              ),
              isVoting
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: LinearProgressIndicator(),
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 5,
              ),
              Text("${widget.opt1}\t\t-   ${opt1Votes} Votes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 3,
              ),
              Text("${widget.opt2}\t\t-   ${opt2Votes} Votes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 3,
              ),
              Text("${widget.opt3}\t\t-   ${opt3Votes} Votes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 3,
              ),
              Text("${widget.opt4}\t\t-   ${opt4Votes} Votes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
