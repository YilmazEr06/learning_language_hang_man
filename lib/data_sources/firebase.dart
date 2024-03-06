import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Firebasehlp {
  bool a = false;
  var db = FirebaseFirestore.instance;

  Future<List> getcatagories() async {
    List catagories = ["hepsi"];
    final docRef = db.collection("games");
    var x = await docRef.get();
   
    for (var i in x.docs) {
      catagories.add(i.id);
    };
    return catagories;
  }

  
  Future<List> getlevels(String id,String catagory) async {
    List levels = [];
    final docRef = db.collection("games").doc(catagory).
    collection("fields").doc(id).collection("levels");
    var x = await docRef.get();
   
    for (var i in x.docs) {
      levels.add(i.id);
    
    };
 
    return levels;
  }


  Future<List> getcards(String catagory) async {
    List cards = [];
    final docRef = db.collection("games").doc(catagory).collection("fields");
    var x = await docRef.get();

    for (var i in x.docs) {
      var list =[i.id,i.data()];
      cards.add(list);
    }
    return cards;
  }
  Future<List> getallcards() async {
    List cards = [];
    final docRef = db.collection("games");
    var x = await docRef.get();
    print(x.docs);
    for (var i in x.docs) {
      print(i.id);
      var y = await docRef.doc(i.id).collection("fields").get();
      for (var g in y.docs){
        print(g.id);
        print(g.data());  
        cards.add([g.id,g.data()]); 
           }
    
      
    }
    return cards;
  }



  logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
