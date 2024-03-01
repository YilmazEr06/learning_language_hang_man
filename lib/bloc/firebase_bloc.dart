import 'package:hang_man/models/cardmodel.dart';

class Data {
  Future <List> getlevelcards(catagory) async {
    List<CardModel> cards = [];

    if (catagory == "bilim") {
      List<CardModel> cards = [
        CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5),
        CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5),
        CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5),CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5)
        ,CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5)
        ,CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5)
        ,CardModel(uid: "uid", name: "Matematik", 
        wordscount: 1500, levelcount: 5)
      ];
      return cards;
    }else if (catagory=="sanat"){
      List<CardModel> cards = [
        CardModel(uid: "uid", name: "Resim ", 
        wordscount: 1500, levelcount: 5),
        CardModel(uid: "uid", name: "Heykel ", 
        wordscount: 1500, levelcount: 5),
      ];
      return cards;

    }else {
      List<CardModel> cards = [
       
      ];
      return cards;

    }

    
  }
}
