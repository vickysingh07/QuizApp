// ignore_for_file: file_names, unused_local_variable
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQueCreator {
  static Future<Map> genQuizQue(String quizID, int queMoney) async {
    late Map queData;
    Random random = Random();
    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc(quizID)
        .collection("questions")
        .where("money", isEqualTo: queMoney)
        .get()
        .then((value) {
      int randomNumber = random.nextInt(value.docs.length);
      queData = value.docs.elementAt(randomNumber).data();
    });
    return queData;
  }
}
