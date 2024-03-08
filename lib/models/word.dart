class WordModel {
  String name;

  String description;

  WordModel({required this.name, required this.description});
  factory WordModel.defaultuser() {
    return WordModel(
      name: 'username',
      description: 'description',
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
 
}
