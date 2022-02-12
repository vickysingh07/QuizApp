// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, must_be_immutable, avoid_print, prefer_const_constructors, non_constant_identifier_names
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbc_app/services/QuestionModel.dart';
import 'package:kbc_app/services/QuizQueCreator.dart';
import 'package:kbc_app/services/firedb.dart';
import 'package:kbc_app/views/loser.dart';
import 'package:kbc_app/views/win.dart';
import 'package:kbc_app/widgets/lifeline_sidebar.dart';

class Question extends StatefulWidget {
  String quizID;
  int queMoney;
  Question({required this.quizID, required this.queMoney});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  QuestionModel questionModel = new QuestionModel();
  AudioPlayer audioPlayer = AudioPlayer();
  genQue() async {
    await QuizQueCreator.genQuizQue(widget.quizID, widget.queMoney)
        .then((queData) {
      setState(() {
        questionModel.question = queData["question"];
        questionModel.correctAnswer = queData["correctAnswer"];

        List options = [
          queData["opt1"],
          queData["opt2"],
          queData["opt3"],
          queData["opt4"],
        ];
        options.shuffle();

        questionModel.option1 = options[0];
        questionModel.option2 = options[1];
        questionModel.option3 = options[2];
        questionModel.option4 = options[3];
      });
    });
  }

  bool optALocked = false;
  bool optBLocked = false;
  bool optCLocked = false;
  bool optDLocked = false;
  int maxSeconds = 30;
  int seconds = 30;
  Timer? timer;

  final player = AudioCache();

  QueTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds--);
      if (seconds == 0) {
        timer?.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Looser(
                    wonMon: widget.queMoney == 5000 ? 0 : widget.queMoney ~/ 2,
                    correctAns: questionModel.correctAnswer)));
      }
    });
  }

  playLocal() async {
    if (widget.queMoney != 5000) {
      final player = AudioCache();
      player.play("audio_effects/QUESTION.mp3");
    }
  }

  playLock() async {
    final player = AudioCache();
    player.play("audio_effects/LOCK_SCREENN.mp3");
  }

  playLosserSound() async {
    final player = AudioCache();
    player.play("audio_effects/WORNG_ANSWER.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    genQue();
    playLocal();
    QueTimer();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showWarning(
            {required BuildContext context,
            required String title,
            required String content}) async =>
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(title),
                  content: Text(content),
                  actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text("No!")),
                    ElevatedButton(
                        onPressed: () async {
                          await FireDB.updateMoney(widget.queMoney == 5000
                              ? 0
                              : widget.queMoney ~/ 2);

                          Navigator.pop(context, true);
                        },
                        child: Text("Okay!")),
                  ],
                ));

    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/backgroundkbc.png"))),
      child: WillPopScope(
        onWillPop: () async {
          final exitQuiz = await showWarning(
              context: context,
              title: "DO YOU WANT TO EXIT QUIZ ?",
              content:
                  "You Will Get Rs.${widget.queMoney == 5000 ? 0 : widget.queMoney / 2} In Your Account.");
          return exitQuiz ?? false;
        },
        child: Scaffold(
          onDrawerChanged: (isOpened) {
            timer?.cancel();
            isOpened ? timer?.cancel() : QueTimer();
          },
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Rs.${widget.queMoney}",
              style: GoogleFonts.aleo(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: LifelineDrawer(
            question: questionModel.question,
            opt1: questionModel.option1,
            opt2: questionModel.option2,
            opt3: questionModel.option3,
            opt4: questionModel.option4,
            correctAns: questionModel.correctAnswer,
            quizID: widget.quizID,
            currentQueMon: widget.queMoney,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ElevatedButton(
            child: Text(
              "QUIT GAME",
              style: GoogleFonts.aBeeZee(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("DO YOU WANT TO QUIT THE GAME"),
                        content: Text(
                            "You will get Rs.${widget.queMoney == 5000 ? 0 : widget.queMoney / 2} In Your Account."),
                        actions: [
                          ElevatedButton(
                              onPressed: () async {
                                await FireDB.updateMoney(widget.queMoney == 5000
                                    ? 0
                                    : widget.queMoney ~/ 2);
                                timer?.cancel;
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text("Quit")),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          )
                        ],
                      ));
            },
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 12,
                      backgroundColor: Colors.yellow,
                      value: seconds / maxSeconds,
                    ),
                    Center(
                        child: Text(
                      seconds.toString(),
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    questionModel.question,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  playLock();
                  timer?.cancel();
                  setState(() {
                    optALocked = true;
                  });

                  Future.delayed(Duration(seconds: 4), () async {
                    if (questionModel.option1 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Win(widget.queMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      playLosserSound();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    wonMon: (widget.queMoney ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: optALocked
                            ? Colors.yellow.withOpacity(0.8)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "A. ${questionModel.option1}",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              InkWell(
                onTap: () {
                  playLock();
                  timer?.cancel();
                  setState(() {
                    optBLocked = true;
                  });

                  Future.delayed(Duration(seconds: 4), () async {
                    if (questionModel.option2 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Win(widget.queMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      playLosserSound();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    wonMon: (widget.queMoney ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: optBLocked
                            ? Colors.yellow.withOpacity(0.8)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "B. ${questionModel.option2}",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              InkWell(
                onTap: () {
                  playLock();
                  timer?.cancel();

                  setState(() {
                    optCLocked = true;
                  });

                  Future.delayed(Duration(seconds: 4), () async {
                    if (questionModel.option3 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Win(widget.queMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      playLosserSound();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    wonMon: (widget.queMoney ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: optCLocked
                            ? Colors.yellow.withOpacity(0.8)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "C. ${questionModel.option3}",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              InkWell(
                onTap: () {
                  playLock();
                  timer?.cancel();
                  setState(() {
                    optDLocked = true;
                  });

                  Future.delayed(Duration(seconds: 4), () async {
                    if (questionModel.option4 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Win(widget.queMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      playLosserSound();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    wonMon: (widget.queMoney ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: optDLocked
                            ? Colors.yellow.withOpacity(0.8)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "D. ${questionModel.option4}",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
