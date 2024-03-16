import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class Shared_preferences {
  SharedPreferences? prefs;

  Future get srfcs async {
    prefs = await SharedPreferences.getInstance();
  }

  Future setusername(String name) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('name', name).then((value) {
      print(prefs!.getString("name"));
    });

  


  }

  Future setuserrandomid() async {
    prefs = await SharedPreferences.getInstance();
    var rng = Random();
    
    await prefs!.setInt('id', rng.nextInt(12));
  }

  Future setuserscor(int scor) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setInt('scor', scor);
  }

  Future setuserlevel(String level) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString('level', level);
  }
}
