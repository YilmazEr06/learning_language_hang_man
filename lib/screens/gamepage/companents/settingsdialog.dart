import 'package:flutter/material.dart';
import 'package:hang_man/screens/gamepage/companents/keyboardsoundslider.dart';
import 'package:hang_man/screens/gamepage/companents/sounslider.dart';
import 'package:stroke_text/stroke_text.dart';

class Settingdialog extends StatefulWidget {

 const Settingdialog({super.key});

  @override
  State<Settingdialog> createState() => SettingdialogState();
}

class SettingdialogState extends State<Settingdialog> {
  TextEditingController controller = TextEditingController();
  late double slidersoundvalue;
  late double sliderkeyboardsoundvalue;
  @override
  void initState() {
    super.initState();
    slidersoundvalue = 10;
    sliderkeyboardsoundvalue =10;
  }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      type: MaterialType.transparency,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
        
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(236, 253, 201, 97),
            borderRadius: BorderRadius.circular(20),
          ),
          child:  const Center(
            child: Stack(
              children: [
                
                 Positioned(
                  top: 10,
                  left: 120,
                  child: StrokeText(
                    strokeWidth: 4,
                    strokeColor: Color.fromARGB(249, 139, 125, 50),
                    text: "Ayarlar",
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  child: Slidersound()
                ),
                Positioned(
                  top: 120,
                  left: 0,
                  child: Keyboardsound()
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
