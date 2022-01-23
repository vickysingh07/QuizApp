import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbc_app/widgets/lifeline_sidebar.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
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
            "Rs. 20,000",
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
                  "Ram is a good boy, very good boy, Who is a good boy.......",
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
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("A. Ram",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("A. Satrughan",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(33)),
                child: Text("A. Bharat",
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
                child: Text("A. Lakshman",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ]),
      ),
    );
  }
}
