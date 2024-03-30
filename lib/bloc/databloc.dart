import 'package:hang_man/data_sources/firebase.dart';

import 'package:hang_man/models/usermodelforscortable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  Future<Map<String, dynamic>> getUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? username = sp.getString("name");
    int? id = sp.getInt("id");
    int? scor = sp.getInt("scor");
    int? level = sp.getInt("level");
    Map<String, dynamic> userInfo;

    if (username != null && username.isNotEmpty) {
       userInfo = {
        "Users": {
          "username":
              username ,
          "scor": scor,
          "uid": id,
          "level": level,
        },
      };
    }else{
        userInfo = {
        "Users": {
          "username":
               "Kullanıcı",
          "scor": 0,
          "uid": 0000,
          "level": 0,
        },
      };
    }

    return userInfo;
  }

  Future<List> getlevelcards(catagory) async {
    List cards = [];
    if (catagory == "hepsi") {
      cards = await Firebasehlp().getallcards();
    } else {
      cards = await Firebasehlp().getcards(catagory);
    }
    return cards;
  }

  Future<List> getcatagory() async {
    List catagories = await Firebasehlp().getcatagories();
    return catagories;
  }

  Future<List> getlevels(String id, String catagory) async {
    return Firebasehlp().getlevels(id, catagory);
  }

  Future<List> getwords(String id, String catagory, String level) async {
    return Firebasehlp().getwords(id, catagory, level);
  }

  Future<List> getcorlist(String a) async {
    if (a == "Hepsi") {
      List cards = [
        UserModel.defaultuser(),
        UserModel.defaultuser(),
        UserModel.defaultuser(),
        UserModel.defaultuser(),
        UserModel.defaultuser(),
      ];
      return cards;
    } else {
      var x = await Firebasehlp().getcards("a");
      return [x];
    }
  }

  addnewuser(UserModel user) async {
    Firebasehlp().newuser(user);
  }
}
