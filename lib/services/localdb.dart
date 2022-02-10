// ignore_for_file: constant_identifier_names, await_only_futures, avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static const uidKey = "fsfjkfskjfsfv";
  static const lkey = "467435bvesgwyh";
  static const rkey = "4543467435bvesgwyh";
  static const nkey = "45363w54svegrft";
  static const mkey = "65g14er4efesdfeaswcsdfv45";
  static const pkey = "65g14ascafder4ev45";
  static const Audkey = "gswdgxertea";
  static const Jokkey = "65g1d24wtafder4ev45";
  static const F50key = "ffterybewryvwresw";
  static const ExpKey = "65g14eryjeryubs45wwwwascafder4ev45";

  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }

  static Future<bool> saveMoney(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mkey, money);
  }

  static Future<String?> getMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mkey);
  }

  static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nkey, name);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nkey);
  }

  static Future<bool> saveUrl(String prourl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pkey, prourl);
  }

  static Future<String?> getUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(pkey);
  }

  static Future<bool> saveLevel(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(lkey, level);
  }

  static Future<String?> getLevel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(lkey);
  }

  static Future<bool> saveRank(String rank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rkey, rank);
  }

  static Future<String?> getRank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rkey);
  }

  static Future<bool> saveAud(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(Audkey, isAvail);
  }

  static Future<bool?> getAud() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(Audkey);
  }

  static Future<bool> saveJoker(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SHARED PREFRWENE");
    print(isAvail);
    return await preferences.setBool(Jokkey, isAvail);
  }

  static Future<bool?> getJoker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(Jokkey);
  }

  static Future<bool> save50(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(F50key, isAvail);
  }

  static Future<bool?> get50() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(F50key);
  }

  static Future<bool> saveExp(bool isAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(ExpKey, isAvail);
  }

  static Future<bool?> getExp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(ExpKey);
  }
}
