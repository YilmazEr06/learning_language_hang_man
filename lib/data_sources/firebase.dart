import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/data_sources/shared_preferences.dart';
import 'package:hang_man/models/usermodelforscortable.dart';

class Firebasehlp {
  bool a = false;
  var db = FirebaseFirestore.instance;

  Future<List> getcatagories() async {
    List catagories = ["hepsi"];
    final docRef = db.collection("games");
    var x = await docRef.get();

    for (var i in x.docs) {
      catagories.add(i.id);
    }

    return catagories;
  }

  changeusername(String? value, String newname) async {
    final docRef = db.collection("users");

    docRef.doc(value).get().then((value1) {
      var map = value1.data();
      map!["Users"]["username"] = newname;
      docRef.doc(value).update(map);
      print(value1.data());
    });
  }

  Future<String> getcatagoryimageurl() async {
    final ref = FirebaseStorage.instance.ref().child('testimage');

    var url = await ref.getDownloadURL();
    print(url);

    return url;
  }

  Future<List> getlevels(String id, String catagory) async {
    List levels = [];
    final docRef = db
        .collection("games")
        .doc(catagory)
        .collection("fields")
        .doc(id)
        .collection("levels");
    var x = await docRef.get();

    for (var i in x.docs) {
      levels.add(i.id);
    }

    return levels;
  }

  Future<List> getuserlist() async {
    List<UserModel> users = [];
    final docRef = db.collection("users");

    var x = await docRef.get();

    for (var i in x.docs) {
      users.add(UserModel.fromJson(i.data()));
    }
    return users;
  }

  Future<List> getwords(String id, String catagory, String lvl) async {
    List<Map> words = [];
    final docRef = db
        .collection("games")
        .doc(catagory)
        .collection("fields")
        .doc(id)
        .collection("levels")
        .doc(lvl)
        .collection("words");
    var x = await docRef.get();

    for (var i in x.docs) {
      words.add(i.data());
    }

    return words;
  }

  Future<List> getcards(String catagory) async {
    List cards = [];
    final docRef = db.collection("games").doc(catagory).collection("fields");
    var x = await docRef.get();

    for (var i in x.docs) {
      var list = [i.id, i.data()];
      cards.add(list);
    }
    return cards;
  }

  Future<List> getallcards() async {
    List cards = [];
    final docRef = db.collection("games");
    var x = await docRef.get();

    for (var i in x.docs) {
      var y = await docRef.doc(i.id).collection("fields").get();
      for (var g in y.docs) {
        cards.add([g.id, g.data()]);
      }
    }
    return cards;
  }

  Future<String> GetImageUrl(String root) async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child(root);
    final url = await ref.getDownloadURL();
    return url;
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> newuser(UserModel user) async {
    Map<String, dynamic> details = {};

    details["Users"] = {}; // Initialize nested map for "Users"
    details["Users"]["scors"] = {};
    // Set user details
    details["Users"]["username"] = user.username;
    details["Users"]["uid"] = user.uid;
    details["Users"]["level"] = user.level;
    details["Users"]["avatar"] = "avatar1";

    // Get dynamic fields from database
    List<dynamic> categories = await Data().getcatagory();

    // Add dynamic fields to the "Users" map
    for (var element in categories) {
      details["Users"]["scors"][element] = 0;
    }

    // Add user details to the database collection
    await db.collection("users").add(details).then((value) {
      Sharedpreferences().setfirebasedocumentid(value.id);
      print(value.id);
    });
  }
}
