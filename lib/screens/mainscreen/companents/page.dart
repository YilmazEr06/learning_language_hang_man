import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Pageimage extends StatefulWidget {
  const Pageimage({
    super.key,
  });

  @override
  State<Pageimage> createState() => _PageimageState();
}

class _PageimageState extends State<Pageimage> with TickerProviderStateMixin {
  late Animation _opacityanimation;
  late AnimationController _controlleropacity;
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    _controlleropacity = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controlleropacity.addListener(() {
      setState(() {
        opacity = _opacityanimation.value;
      });
    });
    _opacityanimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controlleropacity);

    Timer(const Duration(microseconds: 1), () {
      animate();
    });
  }

  void animate() {
    _controlleropacity.reset();
    _controlleropacity.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        
        width: MediaQuery.of(context).size.width,
        bottom: MediaQuery.of(context).size.height * 0.22,
        child: Container(
          alignment: Alignment.center,
          color: const Color.fromARGB(0, 33, 149, 243),
          child: Stack(children: [
            const Positioned(
                child: Image(image: AssetImage("lib/assets/images/page.png"))),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 150,
              right: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: _opacityanimation.value,
                      child: const Image(
                          image: AssetImage("lib/assets/images/stickman.png"))),
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 180,
              right: -60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: _opacityanimation.value,
                      child: const Column(
                        children: [
                          StrokeText(
                            text: "Hadi bulalım",
                            strokeWidth: 3,
                            textStyle: TextStyle(
                                fontSize: 40, fontFamily: "akayakanadaka"),
                          ),
                          StrokeText(
                            text: "şu kelimeyi",
                            strokeWidth: 3,
                            textStyle: TextStyle(
                                fontSize: 40, fontFamily: "akayakanadaka"),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ]),
        ));
  }
}
