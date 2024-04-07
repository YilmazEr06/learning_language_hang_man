import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hang_man/models/usermodelforscortable.dart';
import 'package:stroke_text/stroke_text.dart';

class Listitemwinner extends StatelessWidget {
  const Listitemwinner({
    super.key,
    required this.user,
    required this.category,
    required this.sira,
  });
  final UserModel user;
  final String category;
  final int sira;
  @override
  Widget build(BuildContext context) {
    late Widget image;
    switch (sira) {
      //1. olma durumu
      case 1:
        image = SizedBox(
          width: 500,
          child: Stack(
            
            children: [
            Positioned(
              child: Image(
                image: AssetImage("lib/assets/images/avatarlar/${user.avatar}.png"),
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
         const   Positioned(
            top: 10,
            right: 150,
              child:   Image(
                image: AssetImage("lib/assets/stars/winner1.png"),
                height: 35,
                fit: BoxFit.fill,
              ),
            ),
          ]),
        );

      //2. olma durumu
      case 2:
         image = SizedBox(
          width: 500,
          child: Stack(
            
            children: [
            Positioned(
              child: Image(
                image: AssetImage("lib/assets/images/avatarlar/${user.avatar}.png"),
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
         const   Positioned(
            top: 10,
            right: 150,
              child:   Image(
                image: AssetImage("lib/assets/stars/winner2.png"),
                height: 35,
                fit: BoxFit.fill,
              ),
            ),
          ]),
        );

      //3. olma durumu
      case 3:
         image = SizedBox(
          width: 500,
          child: Stack(
            
            children: [
            Positioned(
              child: Image(
                image: AssetImage("lib/assets/images/avatarlar/${user.avatar}.png"),
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
         const   Positioned(
            top: 10,
            right: 170,
              child:   Image(
                image: AssetImage("lib/assets/stars/winner3.png"),
                height: 35,
                fit: BoxFit.fill,
              ),
            ),
          ]),
        );
      //sıradan olma durumu
      default:
        image = Image(
          image: AssetImage("lib/assets/images/avatarlar/${user.avatar}.png"),
          height: 50,
          fit: BoxFit.fill,
        );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 250, 222, 66)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(left: 15, child: image),
            const Positioned(
                left: 60,
                top: 20,
                child: Image(
                  image: AssetImage("lib/assets/images/kupa.png"),
                  fit: BoxFit.fill,
                  height: 30,
                )),
            Positioned(
                top: 25,
                left: 90,
                child: StrokeText(
                  text: user.scor[category].toString(),
                  textStyle: const TextStyle(fontSize: 20),
                  strokeWidth: 2,
                )),
            Positioned(
                top: 4,
                left: 70,
                child: StrokeText(
                  text: user.username,
                  textStyle: const TextStyle(fontSize: 20),
                  strokeWidth: 4,
                ))
          ],
        ),
      ),
    );
  }
}
