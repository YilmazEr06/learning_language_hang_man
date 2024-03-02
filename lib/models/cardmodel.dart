class CardModel {
  String name;
  int wordscount;
  int levelcount;
  String uid;

  CardModel(
      {required this.uid,
      required this.name,
      required this.wordscount,
      required this.levelcount,
     });
  factory CardModel.defaultuser() {
    return CardModel(
        name: 'username',
        wordscount: 0,
        levelcount: 0,
        uid: 'uid',
       );
  }
 // 
 // factory CardModel.fromFirestore(
 //   DocumentSnapshot<Map<String, dynamic>> snapshot,
 // ) {
 //   final data = snapshot.data();
 //   return CardModel(
 //       name: data?['username'],
 //       wordscount: data?['email'],
 //    
 //      uid: data?['uid'],
 //       );
 // }
//
  Map<String, dynamic> toFirestore() {
    return {
      "username": name,
      "email": wordscount,
      "uid": uid,
    };
  }
}
