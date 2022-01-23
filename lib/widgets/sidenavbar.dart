import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(128, 0, 128, 0.85),
        child: ListView(
          //padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  // ignore: prefer_const_constructors
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Vicky Singh",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Rs. 5000",
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25),
              child: const Text("Leaderboard - 230th rank",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 48,
            ),
            listItem(label: "Daily Quiz", icon: Icons.quiz),
            listItem(label: "Leaderboard", icon: Icons.leaderboard),
            listItem(label: "How to use", icon: Icons.question_answer),
            listItem(label: "About Us", icon: Icons.face_retouching_off_rounded)
          ],
        ),
      ),
    );
  }

  Widget listItem({
    required String label,
    required IconData icon,
  }) {
    // ignore: prefer_const_declarations
    final color = Colors.white;
    const hovercolor = Colors.white60;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      hoverColor: hovercolor,
      title: Text(label, style: TextStyle(color: color)),
    );
  }
}
