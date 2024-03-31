import 'package:flutter/material.dart';
import 'package:hang_man/models/usermodelforscortable.dart';
import 'package:stroke_text/stroke_text.dart';

class Listitemwinner extends StatelessWidget {
  const Listitemwinner({
    super.key, required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 250, 222, 66)),
        child:  Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
                left: 15,
                child: Image(
                  image: AssetImage("lib/assets/images/tac.png"),
                  height: 50,
                  fit: BoxFit.fill,
                )),
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
                  text: user.scor.toString(),
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
