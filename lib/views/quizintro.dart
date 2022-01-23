import 'package:flutter/material.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
            child: const Text(
              "START QUIZ",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {}),
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
                    const Text(
                      "Quiz Name",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Image.network(
                      "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
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
                      const Text(
                        "Science, Space, Astronmy, Rocket, ISRO",
                        style: TextStyle(fontSize: 17),
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
                            const Text(
                              "15 Minutes",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 17),
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
                            const Text(
                              " Rs. 10000",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 17),
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
                            const Text(
                              "Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.Ram is a good boy, very good boy, very very good boy, actually the best boy.",
                              style: TextStyle(fontSize: 17),
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
