import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hang_man/screens/scorpage/companents/Scorinfobar.dart';
import 'package:hang_man/screens/scorpage/companents/catagoryrow.dart';
import 'package:hang_man/screens/scorpage/companents/userlistcolumn.dart';
import 'package:stroke_text/stroke_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/main");
     });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset("lib/assets/stickman.png"),
             const Center(
               child: StrokeText(
               
                 text: " Öğretirken \n eğlendiren \n  bir oyun",
                 strokeWidth: 5,
                 
                 textStyle: TextStyle(
               
                   fontSize: 25,
                   decoration: TextDecoration.none),
               ),
             ),
             
          ],
        )));
      
  }
}
