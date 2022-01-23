// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LifelineDrawer extends StatefulWidget {
  const LifelineDrawer({Key? key}) : super(key: key);

  @override
  _LifelineDrawerState createState() => _LifelineDrawerState();
}

class _LifelineDrawerState extends State<LifelineDrawer> {
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
                          "RS. ${(5000) * (index + 1)}",
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
