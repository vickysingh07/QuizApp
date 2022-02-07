// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:kbc_app/services/question.dart';

class Win extends StatefulWidget {
  int queMoney;
  String QuizID;
  Win(this.queMoney, this.QuizID);

  @override
  _WinState createState() => _WinState();
}

class _WinState extends State<Win> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/win.png"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: ElevatedButton(
            child: const Text("Share With Friends"),
            onPressed: () {},
          ),
          body: Stack(
            children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Text("CONGRATULATIONS!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    const Text("YOUR ANSWER IS CORRECT",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("You Won",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                    Text("Rs. ${widget.queMoney}",
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset("assets/cheque.jpg")),
                    ElevatedButton(
                      child: const Text("Next Question"),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Question(
                                    quizID: widget.QuizID,
                                    queMoney: (widget.queMoney) * 2))));
                      },
                    )
                  ])),
              buildConfettiWidget(confettiController, pi / 2),
            ],
          )),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: const Size(40, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.2,
        numberOfParticles: 8,
        gravity: 0.01,
      ),
    );
  }
}
