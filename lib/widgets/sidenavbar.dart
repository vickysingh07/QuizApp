// ignore_for_file: use_key_in_widget_constructors, invalid_required_positional_param, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbc_app/services/auth.dart';
import 'package:kbc_app/views/home.dart';
import 'package:kbc_app/views/login.dart';
import 'package:kbc_app/views/profile.dart';

class SideNav extends StatelessWidget {
  String name;
  String money;
  String rank;
  String proUrl;
  String level;
  SideNav(@required this.name, @required this.money, @required this.rank,
      @required this.proUrl, @required this.level);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.purple,
        child: ListView(
          // padding:  EdgeInsets.symmetric(horizontal: 20),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              name: name,
                              rank: rank,
                              proUrl: proUrl,
                              level: level,
                              money: money,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(proUrl),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: GoogleFonts.alike(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Rs.$money",
                              style: GoogleFonts.alike(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Leaderboard - $rank Rank",
                        style: GoogleFonts.alice(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.white,
            ),
            SizedBox(
              height: 24,
            ),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home()),
                label: "DAILY QUIZ",
                icon: Icons.quiz),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home()),
                label: "Leaderboard",
                icon: Icons.leaderboard),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home()),
                label: "How To Use",
                icon: Icons.question_answer),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home()),
                label: "About Us",
                icon: Icons.face),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Login()),
                label: "Logout",
                icon: Icons.logout)
          ],
        ),
      ),
    );
  }

  Widget listItem(
      {required String label,
      required IconData icon,
      required BuildContext context,
      required MaterialPageRoute path}) {
    const color = Colors.white;
    const hovercolor = Colors.white60;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      hoverColor: hovercolor,
      title: Text(
        label,
        style: GoogleFonts.aBeeZee(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      onTap: () async {
        await signOut();
        Navigator.pushReplacement(context, path);
      },
    );
  }
}
