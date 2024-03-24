import 'package:flutter/material.dart';

import 'package:stroke_text/stroke_text.dart';

class Deadialog extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  Deadialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: 340,
          height: 225,
          decoration: BoxDecoration(
            color: const Color.fromARGB(236, 253, 201, 97),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 10,
                  child: Image.asset("lib/assets/images/stickman.png"),
                ),
                const Positioned(
                  top: 20,
                  left: 90,
                  child: StrokeText(
                    strokeWidth: 4,
                    strokeColor: Color.fromARGB(249, 139, 125, 50),
                    text: "Skor: #150",
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 90,
                  child: StrokeText(
                    strokeWidth: 4,
                    strokeColor: Color.fromARGB(249, 139, 125, 50),
                    text: "en yüksek skor ",
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 80,
                  left: 90,
                  child: StrokeText(
                    strokeWidth: 4,
                    strokeColor: Color.fromARGB(249, 139, 125, 50),
                    text: "500   : radrescan ",
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 125,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                                    
                    },
                    child: Image.asset("lib/assets/images/save.png"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
