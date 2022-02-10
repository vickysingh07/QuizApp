// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbc_app/services/checkquizunlock.dart';
import 'package:kbc_app/services/localdb.dart';
import 'package:kbc_app/services/quizdhandha.dart';
import 'package:kbc_app/views/home.dart';

class QuizIntro extends StatefulWidget {
  String QuizName;
  String QuizImgUrl;
  String QuizTopics;
  String QuizDuration;
  String QuizAbout;
  String QuizId;
  String QuizPrice;
  QuizIntro(
      {required this.QuizAbout,
      required this.QuizDuration,
      required this.QuizImgUrl,
      required this.QuizName,
      required this.QuizTopics,
      required this.QuizId,
      required this.QuizPrice});

  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  bool quizIsUnlocked = false;
  getQuizUnlockStatus() async {
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizId)
        .then((unlockStatus) {
      setState(() {
        quizIsUnlocked = unlockStatus;
      });
    });
  }

  setLifeLAvail() async {
    await LocalDB.saveAud(true);
    await LocalDB.saveJoker(true);
    await LocalDB.save50(true);
    await LocalDB.saveExp(true);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()))
        .then((value) => setLifeLAvail());
  }

  @override
  void initState() {
    getQuizUnlockStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
            child: Text(
              quizIsUnlocked ? "Got It" : "UNLOCK QUIZ",
              style: const TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              quizIsUnlocked
                  ? setLifeLAvail()
                  : QuizDhandha.buyQuiz(
                          QuizID: widget.QuizId,
                          QuizPrice: int.parse(widget.QuizPrice))
                      .then((quizKharidLiya) {
                      if (quizKharidLiya) {
                        setState(() {
                          quizIsUnlocked = true;
                        });
                      } else {
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                      "You do not have enough money to buy this QUIZ!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK"))
                                  ],
                                ));
                      }
                    });
            }),
        appBar: AppBar(
          title: Text(
            "KBC Quiz App",
            style: GoogleFonts.aleo(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.QuizName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aleo(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Image.network(
                      widget.QuizImgUrl,
                      fit: BoxFit.cover,
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.topic_outlined),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Related To -",
                            style: GoogleFonts.aleo(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                      Text(
                        widget.QuizTopics,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Duration -",
                                  style: GoogleFonts.aleo(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              "${widget.QuizDuration} Minutes",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      quizIsUnlocked
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.money),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "Money -",
                                        style: GoogleFonts.aleo(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Text(
                                    " Rs. ${widget.QuizPrice}",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.quiz),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "About Quiz -",
                                  style: GoogleFonts.aleo(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              widget.QuizAbout,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
