import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String email, String photoUrl, String uid) async {
    // ignore: non_constant_identifier_names
    final User? current_user = _auth.currentUser;
    if (await getUser()) {
      // ignore: avoid_print
      print("USER ALREADY EXISTS");
    } else {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(current_user!.uid)
          .set({
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "money": "5000"
      }).then((value) {
        // ignore: avoid_print
        print("User Registered Successfully");
      });
    }
  }

  Future<bool> getUser() async {
    // ignore: non_constant_identifier_names
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance
        .collection("users")
        .doc(current_user!.uid)
        .get()
        .then((value) {
      user = value.data().toString();
    });
    if (user.toString() == "null") {
      return false;
    } else {
      return true;
    }
  }
}
