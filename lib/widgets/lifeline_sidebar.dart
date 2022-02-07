// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbc_app/services/localdb.dart';
import 'package:kbc_app/views/AudiencePoll.dart';

class LifelineDrawer extends StatefulWidget {
  late String question;
  late String opt1;
  late String opt2;
  late String opt3;
  late String opt4;
  late String quizID;
  late String correctAns;
  late int currentQueMon;

  LifelineDrawer({
    required this.question,
    required this.opt1,
    required this.opt2,
    required this.opt3,
    required this.opt4,
    required this.correctAns,
    required this.quizID,
    required this.currentQueMon,
  });

  @override
  _LifelineDrawerState createState() => _LifelineDrawerState();
}

class _LifelineDrawerState extends State<LifelineDrawer> {
  Future<bool> checkAudAvail() async {
    bool AudAvail = true;
    await LocalDB.getAud().then((value) {
      AudAvail = value!;
    });
    return AudAvail;
  }

  Future<bool> checkJokAvail() async {
    bool JokAvail = true;
    await LocalDB.getJoker().then((value) {
      print("JOKER IS");
      print(value);
      JokAvail = value!;
    });
    return JokAvail;
  }

  Future<bool> checkf50Avail() async {
    bool f50Avail = true;
    await LocalDB.get50().then((value) {
      f50Avail = value!;
    });
    return f50Avail;
  }

  Future<bool> checkExpAvail() async {
    bool ExpAvail = true;
    await LocalDB.getExp().then((value) {
      ExpAvail = value!;
    });
    return ExpAvail;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("LifeLine",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  if (await checkAudAvail()) {
                    await LocalDB.saveAud(false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AudiencePoll(
                                question: widget.question,
                                opt1: widget.opt1,
                                opt2: widget.opt2,
                                opt3: widget.opt3,
                                opt4: widget.opt4,
                                correctAns: widget.correctAns))));
                  } else {
                    print("Audience Poll is already used");
                  }
                },
                child: Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purpleAccent),
                          child: const Icon(Icons.people,
                              size: 32, color: Colors.white)),
                    ),
                    const SizedBox(height: 5),
                    const Text("Audience\n Poll", textAlign: TextAlign.center),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purpleAccent),
                          child: const Icon(Icons.change_circle,
                              size: 32, color: Colors.white)),
                    ),
                    const SizedBox(height: 5),
                    const Text("Joker\n Question", textAlign: TextAlign.center),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purpleAccent),
                          child: const Icon(Icons.star_half,
                              size: 32, color: Colors.white)),
                    ),
                    const SizedBox(height: 5),
                    const Text("Fifty\n 50", textAlign: TextAlign.center),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purpleAccent),
                          child: const Icon(Icons.desktop_mac,
                              size: 32, color: Colors.white)),
                    ),
                    const SizedBox(height: 5),
                    const Text("Ask The\n Expert", textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("PRIZES",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: 480,
              child: Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 13,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          "${index + 1}",
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        title: Text(
                          "RS. ${2500 * (pow(2, index + 1))}",
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        trailing: const Icon(Icons.circle),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
