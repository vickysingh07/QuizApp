import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile(
      String name, String rank, String money, String proUrl, String level,
      {Key? key})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add)),
        ],
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              height: 370,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Ram\nRs.50,000)}",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("#60",
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9))),
                          const Text("Rank",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Leaderboard",
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 300,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: const [
                                CircleAvatar(),
                                SizedBox(
                                  width: 3,
                                ),
                                Text("Vicky Singh")
                              ],
                            ),
                            leading: Text(
                              "#${index + 1}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                                "Rs.${(200000 / (index + 1)).toString().substring(0, 7)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              thickness: 1,
                              color: Colors.purple,
                              indent: 10,
                              endIndent: 10,
                            ),
                        itemCount: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
