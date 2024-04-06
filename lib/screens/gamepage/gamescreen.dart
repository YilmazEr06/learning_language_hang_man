import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/gamepage/companents/klavye.dart';
import 'package:hang_man/screens/gamepage/companents/paper.dart';
import 'package:hang_man/screens/gamepage/companents/userinfobargame/userinfobargame.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});
  @override
  State<Gamepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Gamepage> with TickerProviderStateMixin {
  double bottom = -10;
  double opacity = 0;
  int gamescor = 0;

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

  List passedbuttons = [];
  @override
  Widget build(BuildContext context) {
    List<WordModel> arguments =
        ModalRoute.of(context)?.settings.arguments as List<WordModel>;

    addpassedbuttons(String x) {
      setState(() {
        if (!passedbuttons.contains(x)) {
          passedbuttons.add(x);
          passedbuttons = passedbuttons;
        }
      });
    }

    increasescor() {
      Timer(const Duration(microseconds: 10), () {
        setState(() {
          gamescor = gamescor + 10;
        
        });
      });
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(children: [
              Userinfobargame(gamescor: gamescor),
              Gamepaper(
                increasescor: increasescor,
                arguments: arguments,
                passedbuttons: passedbuttons,
                opacity: opacity,
                bottom: bottom,
              ),
              Klavye(
                passedbuttonsfunc: addpassedbuttons,
                bottom: bottom,
                opacity: opacity,
                passedbuttons: passedbuttons,
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
