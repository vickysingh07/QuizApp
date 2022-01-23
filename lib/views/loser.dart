import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Looser extends StatelessWidget {
  int wonMon;
  String correctAns;

  Looser({Key? key, required this.wonMon, required this.correctAns})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/loose.png"), fit: BoxFit.cover)),
      child: Scaffold(
          floatingActionButton: ElevatedButton(
            child: const Text("Retry"),
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Oh Sorry!",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  const Text("YOUR ANSWER IS INCORRECT",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  // ignore: unnecessary_brace_in_string_interps
                  Text("CORRECT ANSWER IS ${correctAns}",
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("You Won",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      )),
                  Text("Rs.${wonMon == 2500 ? 0 : wonMon}",
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  const Icon(Icons.error_outline,
                      size: 100, color: Colors.white),
                  ElevatedButton(
                    child: const Text("Go To Rewards"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]),
          )),
    );
  }
}
