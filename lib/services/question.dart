// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbc_app/services/QuestionModel.dart';
import 'package:kbc_app/services/QuizQueCreator.dart';
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

  @override
  void initState() {
    super.initState();
    genQue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/backgroundkbc.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Rs. ${widget.queMoney}",
            style: GoogleFonts.acme(fontSize: 27),
          ),
          centerTitle: true,
        ),
        drawer: const LifelineDrawer(),
        floatingActionButton: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Quit Game",
              style: GoogleFonts.alice(fontSize: 25),
            )),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 8,
                      backgroundColor: Colors.white,
                    ),
                    Center(
                        child: Text(
                      "45",
                      style: GoogleFonts.adamina(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  questionModel.question,
                  style: GoogleFonts.aBeeZee(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("A. ${questionModel.option1}",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("B. ${questionModel.option2}",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("C. ${questionModel.option3}",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("D. ${questionModel.option4}",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ]),
      ),
    );
  }
}
