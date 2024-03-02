import 'package:hang_man/models/cardmodel.dart';
import 'package:hang_man/models/usermodelforscortable.dart';

class Data {
  Future<List> getlevelcards(catagory) async {
    if (catagory == "Bilim") {
      List<CardModel> cards = [
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5),
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5),
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5),
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5),
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5),
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5),
        CardModel(
            uid: "uid", name: "Matematik", wordscount: 1500, levelcount: 5)
      ];
      return cards;
    } else if (catagory == "Sanat") {
      List<CardModel> cards = [
        CardModel(uid: "uid", name: "Resim ", wordscount: 1500, levelcount: 5),
        CardModel(uid: "uid", name: "Heykel ", wordscount: 1500, levelcount: 5),
      ];
      return cards;
    } else if (catagory == "Hepsi") {
      List<CardModel> cards = [
        CardModel(uid: "uid", name: "Resim ", wordscount: 1500, levelcount: 5),
        CardModel(uid: "uid", name: "Heykel ", wordscount: 1500, levelcount: 5),
        CardModel(uid: "uid", name: "Heykel ", wordscount: 1500, levelcount: 5),
      ];
      return cards;
    } else {
      List<CardModel> cards = [];
      return cards;
    }
  }

  Future<List> getcatagory() async {
    List cards = ["Hepsi", "Bilim", "Sanat", "Mühendislik"];
    return cards;
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
    } else if (a == "Bilim") {
      List cards = [
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
      ];
      return cards;
    } else if (a == "Sanat") {
      List cards = [
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
        UserModelForSkor.defaultuser(),
      ];
      return cards;
    } else {
      return [];
    }
  }
}
