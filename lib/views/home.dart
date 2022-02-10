// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kbc_app/services/home_fire.dart';
import 'package:kbc_app/services/localdb.dart';
import 'package:kbc_app/views/quizintro.dart';
import 'package:kbc_app/widgets/sidenavbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "User Name";
  String money = "--";
  String lead = "---";
  String proUrl = "---";
  String level = "0";

  late List quizzes;

  bool isLoading = true;
  getUserDet() async {
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });

    await LocalDB.getMoney().then((value) {
      setState(() {
        money = value.toString();
      });
    });

    await LocalDB.getRank().then((value) {
      setState(() {
        lead = value.toString();
      });
    });

    await LocalDB.getUrl().then((value) {
      setState(() {
        proUrl = value.toString();
      });
    });

    await LocalDB.getLevel().then((value) {
      setState(() {
        level = value.toString();
      });
    });
  }

  getquiz() async {
    await HomeFire.getquizzes().then((returned_quizzes) {
      setState(() {
        quizzes = returned_quizzes;
        isLoading = false;
      });
    });
  }

  late Map<String, dynamic> TopPlayer;
  getTopPlayer() async {
    await FirebaseFirestore.instance
        .collection("user")
        .orderBy("money", descending: true)
        .get()
        .then((value) {
      setState(() {
        TopPlayer = value.docs.elementAt(0).data();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDet();
    getquiz();
    getTopPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "KBC QUIZ APP",
                    style: GoogleFonts.alata(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: LinearProgressIndicator(),
                  ),
                ],
              ),
            ),
          )
        : RefreshIndicator(
            onRefresh: () async {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'KBC - Quiz Game',
                    style: GoogleFonts.aleo(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                drawer: SideNav(name, money, lead, proUrl, level),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        CarouselSlider(
                            items: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuizIntro(
                                                QuizAbout:
                                                    (quizzes[0])["about_quiz"],
                                                QuizImgUrl: (quizzes[0])[
                                                    "quiz_thumbnail"],
                                                QuizDuration:
                                                    (quizzes[0])["duration"],
                                                QuizTopics:
                                                    (quizzes[0])["topics"],
                                                QuizName:
                                                    (quizzes[0])["quiz_name"],
                                                QuizId: (quizzes[0])["Quizid"],
                                                QuizPrice: (quizzes[0])[
                                                    "unlock_money"],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            (quizzes[0])["quiz_thumbnail"],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuizIntro(
                                                QuizAbout:
                                                    (quizzes[0])["about_quiz"],
                                                QuizImgUrl: (quizzes[0])[
                                                    "quiz_thumbnail"],
                                                QuizDuration:
                                                    (quizzes[0])["duration"],
                                                QuizTopics:
                                                    (quizzes[0])["topics"],
                                                QuizName:
                                                    (quizzes[0])["quiz_name"],
                                                QuizId: (quizzes[0])["Quizid"],
                                                QuizPrice: (quizzes[0])[
                                                    "unlock_money"],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            (quizzes[0])["quiz_thumbnail"],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                                height: 180,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.8)),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Richest Player In The World",
                                    style: GoogleFonts.alice(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(TopPlayer["photoUrl"]),
                                        radius: 50,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            TopPlayer["name"]
                                                        .toString()
                                                        .length >=
                                                    16
                                                ? "${TopPlayer["name"].toString().substring(0, 15)}..."
                                                : TopPlayer["name"],
                                            style: GoogleFonts.alike(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.deepOrange),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Rs. ${TopPlayer["money"]}",
                                            style: GoogleFonts.alike(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.deepOrange),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ])),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quizzes To Earn Money",
                                style: GoogleFonts.alice(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => QuizIntro(
                                                    QuizAbout: (quizzes[0])[
                                                        "about_quiz"],
                                                    QuizImgUrl: (quizzes[0])[
                                                        "quiz_thumbnail"],
                                                    QuizDuration: (quizzes[0])[
                                                        "duration"],
                                                    QuizTopics:
                                                        (quizzes[0])["topics"],
                                                    QuizName: (quizzes[0])[
                                                        "quiz_name"],
                                                    QuizId:
                                                        (quizzes[0])["Quizid"],
                                                    QuizPrice: (quizzes[0])[
                                                        "unlock_money"],
                                                  )));
                                    },
                                    child: Stack(
                                      children: [
                                        Card(
                                          elevation: 8,
                                          child: Container(
                                            height: 200,
                                            width: 300,
                                            child: Image.network(
                                              (quizzes[0])["quiz_thumbnail"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: [
                                      Card(
                                        elevation: 8,
                                        child: Container(
                                          height: 200,
                                          width: 300,
                                          child: Image.network(
                                            "https://images.unsplash.com/photo-1515325595179-59cd5262ca53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
  }
}
