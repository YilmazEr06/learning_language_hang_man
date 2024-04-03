import 'dart:io';
import 'dart:math';

import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/models/usermodelforscortable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences {
  SharedPreferences? prefs;

  Future get srfcs async {
    prefs = await SharedPreferences.getInstance();
  }

  Future setusername(String name) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString('name', name).then((value) {});
  }

  Future setuserrandomid() async {
    prefs = await SharedPreferences.getInstance();
    var rng = Random();
    int num = rng.nextInt(12);
    await prefs!.setInt('id', num);
    return num;
  }

  Future setuserscor(int scor) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setInt('scor', scor);
  }

  Future setuserlevel(int level) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setInt('level', level);
  }

  Future createuserinfo(String name) async {
    prefs = await SharedPreferences.getInstance();

    //kullanıcının adı
    Sharedpreferences().setusername(name);

    //kullanıcının başlangıç leveli
    Sharedpreferences().setuserlevel(1);

    //kullanıcının başlangıç skoru
    Sharedpreferences().setuserscor(0);

    //İd and update server
    Sharedpreferences().setuserrandomid().then((value) async {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
          Data().addnewuser(UserModel(
              uid: value.toString(), username: name, scor: {
        "hepsi": 0,
        "sanat": 0,
        "bilim": 0,

      }, level: 1));
        }
      } on SocketException catch (_) {
        print('not connected');
      }
    });
  }
}
