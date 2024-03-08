import 'package:hang_man/data_sources/firebase.dart';

import 'package:hang_man/models/usermodelforscortable.dart';

class Data {
  Future<Map> get userinfo async {
    Map map = {
      "Users": {
        "username": "Radrescan",
        "scor": 1000,
        "uid": 12345,
        "level": 5,
      },
    };
    return map;
  }

  Future<List> getlevelcards(catagory) async {
    List cards=[];
    if (catagory== "hepsi"){
       cards= await Firebasehlp().getallcards();

    }else{
        cards= await Firebasehlp().getcards(catagory);}
    return cards;
  
  }

  Future<List> getcatagory() async {
    List catagories = await Firebasehlp().getcatagories();
    return catagories;
  }
  
  Future<List> getlevels(String id,String catagory) async {
    return Firebasehlp().getlevels(id,catagory);
  }

  Future<List> getwords(String id,String catagory,String level) async {
    return Firebasehlp().getwords(id,catagory,level);
  }
  
  Future<List> getcorlist(String a) async {
    if (a == "Hepsi") {
      List cards = [
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
      ];
      return cards;
    } else {
      var x = await Firebasehlp().getcards("a");
      print("kart");
      return [x];
    }
  }
}
