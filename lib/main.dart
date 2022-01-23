import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kbc_app/views/loser.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KBC QUIZ',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Looser(
          wonMon: 50000,
          correctAns: "Ram",
        ),
      ),
    );
  }
}
