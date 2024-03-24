import 'dart:async';

import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    super.key,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> with TickerProviderStateMixin {
  double bottom = -10;
  double opacity = 0;

  late Animation _moveanimation;
  late AnimationController _controllermove;

  late Animation _opacityanimation;
  late AnimationController _controlleropacity;


  @override
  void initState() {
    super.initState();
    _controllermove = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controllermove.addListener(() {
      setState(() {
        bottom = _moveanimation.value;
      });
    });

    _controlleropacity = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controlleropacity.addListener(() {
      setState(() {
        opacity = _opacityanimation.value;
      });
    });


    Timer(const Duration(milliseconds: 1), () {
      animate();
    });

  }

  void animate() {
    _moveanimation = _controllermove.drive(
      Tween<double>(
        begin: -10,
        end: MediaQuery.of(context).size.height * 0.05,
      ),
    );
    _controllermove.reset();
    _controllermove.forward();

    _opacityanimation = _controlleropacity.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );
    _controlleropacity.reset();
    _controlleropacity.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controllermove.dispose();
    _controlleropacity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      bottom: bottom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/selectCatagorypage');
              },
              child:  Opacity(
                opacity: opacity,
                child: const Image(
                  image:  AssetImage("lib/assets/images/start.png"),
                    
                ),
              )),
          const SizedBox(
            height: 6,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/scorpage');
              },
              child: Opacity(
                opacity: opacity,
                child: const Image(
                  image: AssetImage("lib/assets/images/skortable.png"),
                            
                ),
              ))
        ],
      ),
    );
  }
}
