import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  // ignore: prefer_const_declarations
  static final uidKey = "jakfjadk";

  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    return await preferences.getString(uidKey);
  }
}
