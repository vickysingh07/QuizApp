import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kbc_app/services/localdb.dart';
import 'package:kbc_app/widgets/sidenavbar.dart';

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
  }

  @override
  void initState() {
    super.initState();
    getUserDet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: SideNav(name, money, lead, proUrl, level),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(children: [
                  CarouselSlider(
                      items: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
                                  ),
                                  fit: BoxFit.cover)),
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
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8)),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleAvatar(
                            backgroundColor: Colors.purple, radius: 35),
                        CircleAvatar(
                            backgroundColor: Colors.redAccent, radius: 35),
                        CircleAvatar(backgroundColor: Colors.green, radius: 35),
                        CircleAvatar(
                            backgroundColor: Colors.yellowAccent, radius: 35),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    height: 150,
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(width: 10),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    height: 150,
                                    child: Image.network(
                                        "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    height: 150,
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(width: 10),
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 8,
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    height: 150,
                                    child: Image.network(
                                        "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Stack(
                      children: [
                        Card(
                          elevation: 8,
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Image.network(
                                "https://images.unsplash.com/photo-1632931612792-fbaacfd952f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1332&q=80",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}
