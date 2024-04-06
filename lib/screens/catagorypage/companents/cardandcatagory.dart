import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/firebase.dart';

class Cardclass extends StatefulWidget {
  const Cardclass({
    super.key,
    required this.data,
  });
  final List data;

  @override
  State<Cardclass> createState() => _CardclassState();
}

class _CardclassState extends State<Cardclass> {
  bool imagesexist = false;
  String imageurl = "";
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
   Firebasehlp().GetImageUrl(widget.data[0][1]["img"]).then((value) {
       setState(() {
      imageurl = value;
      imagesexist = true;
    });
    },);
    print(widget.data);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(0, 158, 158, 158),
      child: SizedBox(
        height: 175,
        width: 175,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imagesexist
                    ? NetworkImage(imageurl)
                    : const AssetImage("lib/assets/images/math.png")
                        as ImageProvider,
                fit: BoxFit.fill,
              )),
          child: Stack(
            children: [
              Positioned(
                  top: 65,
                  left: 10,
                  child: Text(
                    (widget.data[0][0] as String).toUpperCase(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 95,
                  left: 12,
                  child: Text(
                    "Kelime sayısı: ${widget.data[0][1]["topwordcount"]}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 254, 11, 11)),
                  )),
              Positioned(
                  top: 110,
                  left: 12,
                  child: Text(
                    "${widget.data[0][1]["levelcounts"]} seviye mevcut",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 8, 8)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Padding head(String head, bool iscurrent) {
  double width = 0;
  if (head.length.toDouble() * 22 < 100) {
    width = 100;
  } else {
    width = head.length.toDouble() * 22;
  }

  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
      child: Container(
        
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: iscurrent? const Color.fromARGB(255, 212, 169, 25): const Color.fromARGB(136, 228, 187, 53),
            borderRadius: BorderRadius.circular(20)),
        height: 35,
        width: width,
        child: Text(
          head.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
}
