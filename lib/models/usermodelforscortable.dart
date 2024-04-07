class UserModel {
   String username;
   Map scor;
   int level;
   String uid;
   String avatar;

  UserModel({
    required this.uid,
    required this.username,
    required this.scor,
    required this.level,
    required this.avatar,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
   
    return UserModel(
      uid: json["Users"]['uid'],
      username: json["Users"]['username'],
      scor: json["Users"]['scors'],
      level: json["Users"]['level'],
      avatar: json["Users"]['avatar'],
    );
  }
  factory UserModel.defaultuser() {
    return UserModel(
      uid: '123456',
      username: 'Radrescan',
      scor: {
        "hepsi": 0,
        "sanat": 0,
        "bilim": 0,

      },
      level: 1,
      avatar: "1"
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
      "username": username,
      "scor": 0,
      "uid": uid,
      "level": level,
    };
  }
}
