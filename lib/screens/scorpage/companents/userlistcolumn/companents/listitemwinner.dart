import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Listitemwinner extends StatelessWidget {
  const Listitemwinner({
    super.key,
  });

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
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 15,
                child: Image(
                  image: AssetImage("lib/assets/images/tac.png"),
                  height: 50,
                  fit: BoxFit.fill,
                )),
            Positioned(
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
                  text: "123456",
                  textStyle: TextStyle(fontSize: 20),
                  strokeWidth: 2,
                )),
            Positioned(
                top: 4,
                left: 70,
                child: StrokeText(
                  text: "Radrescan2003",
                  textStyle: TextStyle(fontSize: 20),
                  strokeWidth: 4,
                ))
          ],
        ),
      ),
    );
  }
}
