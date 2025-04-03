import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainpage.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized(); // initialization no thay tya shudhi control aagal no jay..
  Preference.initPref();
  return runApp(MaterialApp(home: mainPage(),debugShowCheckedModeBanner: false,));
}
class Preference{
  static SharedPreferences? prefs;
  static initPref() async {
    prefs=await SharedPreferences.getInstance();
    print("Prefrence Initialized");
  }

  static setlastLevel(int levelNumber) async {
    prefs?.setInt("LastLevel", levelNumber);
  }
  static int? getlastLevel() {
    return prefs!.getInt("LastLevel")??0;
  }
  static setWinLevel(int levelNumber){
    prefs?.setString("WinLevel_$levelNumber",'Win');
  }
  static setSkipLevel(int levelNumber){
    prefs?.setString("WinLevel_$levelNumber",'skip');
  }
  static String? getlevelStatus(int levelNumber){
    return prefs!.getString('WinLevel_$levelNumber')??'Pending';
  }
}
