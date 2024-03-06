import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/shared_preferences.dart';
import 'package:stroke_text/stroke_text.dart';

class CustomDialog extends StatelessWidget {
   TextEditingController controller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Hero(
          tag: 'hero-tag', 
          child: Container(
            width: 340,
            height: 225,
            decoration: BoxDecoration(
              color: const Color.fromARGB(236, 253, 201, 97),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Image.asset("lib/assets/stickman.png"),
                    ),
                    const Positioned(
                      top: 20,
                      left: 115,
                      child:   StrokeText(
                        strokeWidth: 4,
                        strokeColor: Color.fromARGB(249, 139, 125, 50),
                        text: "Adınızı girin",
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                      Positioned(
                      top: 70,
                      left: 100,
                      child: SizedBox(
                        width: 190,
                        height: 50,
                        child: Material( // Wrap TextField with Material widget
                          color: const Color.fromARGB(255, 243, 226, 179),
                          borderRadius: BorderRadius.circular(20),
                          child:  Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '#oldname',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 125,
                      child: GestureDetector(
                        onTap: () {
                           Shared_preferences().setuserid(controller.text).then((value) {
                            Navigator.pop(context);
                           });
                           
                        },
                        child: Image.asset("lib/assets/save.png")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}