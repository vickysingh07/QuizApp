// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:kbc_app/services/QuizQueCreator.dart';
import 'package:kbc_app/services/checkquizunlock.dart';
import 'package:kbc_app/services/question.dart';
import 'package:kbc_app/services/quizdhandha.dart';

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
              quizIsUnlocked ? "START QUIZ" : "UNLOCK QUIZ",
              style: const TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              quizIsUnlocked
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Question(quizID: widget.QuizId, queMoney: 5000)))
                  : QuizDhandha.buyQuiz(
                          QuizID: widget.QuizId,
                          QuizPrice: int.parse(widget.QuizPrice))
                      .then((quizKharidLiya) {
                      if (quizKharidLiya) {
                        print("GIII");
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
          title: const Text("KBC Quiz App"),
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
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
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
                        children: const [
                          Icon(Icons.topic_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Related To -",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        widget.QuizTopics,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.topic_outlined),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Duration -",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text(
                              "${widget.QuizDuration} Minutes",
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 17),
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
                                    children: const [
                                      Icon(Icons.money),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "Money -",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                    " Rs. ${widget.QuizPrice}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 17),
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
                              children: const [
                                Icon(Icons.topic_outlined),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "About Quiz -",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text(
                              widget.QuizAbout,
                              style: const TextStyle(fontSize: 17),
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
