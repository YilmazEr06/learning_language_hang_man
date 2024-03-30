class UserModel {
  final String username;
  final int scor;
  final int level;
  final String uid;

  UserModel({
    required this.uid,
    required this.username,
    required this.scor,
    required this.level,
  });

  factory UserModel.defaultuser() {
    return UserModel(
      uid: '123456',
      username: 'Radrescan',
      scor: 0,
      level: 1,
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
