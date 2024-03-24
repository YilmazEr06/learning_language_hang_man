import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 2), () {
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
            
            Image.asset("lib/assets/images/stickman.png"),
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
