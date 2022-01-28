// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeFire {
  static Future<List<Map<String, dynamic>>> getquizzes() async {
    List<Map<String, dynamic>> all_quiz = [];
    await FirebaseFirestore.instance
        .collection("quizzes")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((quiz) {
        Map<String, dynamic> myQuiz = quiz.data();
        myQuiz["Quizid"] = quiz.reference.id;
        print(quiz.data());

        all_quiz.add(myQuiz);
      });
    });

    return all_quiz;
  }
}
