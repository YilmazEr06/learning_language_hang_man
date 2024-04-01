import 'package:flutter/material.dart';

class Buildadam extends StatefulWidget {
  const Buildadam({
    super.key,
    required this.sayac,
  });
  final int sayac;

  @override
  State<Buildadam> createState() => BuildadamState();
}

class BuildadamState extends State<Buildadam> with TickerProviderStateMixin {

  int delaymicroseconds = 400;
  double bottombacak1 = 0;
  double opacitybacak1 = 0;

  late Animation animationbacak1;
  late AnimationController _controllerbacak1;

  double bottomkol1 = 0;
  double opacitykol1 = 0;

  late Animation animationkol1;
  late AnimationController _controllerkol1;

  double bottomkol2 = 0;
  double opacitykol2 = 0;

  late Animation animationkol2;
  late AnimationController _controllerkol2;

  double bottombacak2 = 0;
  double opacitybacak2 = 0;

  late Animation animationbacak2;
  late AnimationController _controllerbacak2;

  double bottomkelle = 0;
  double opacitykelle = 0;

  late Animation animationkelle;
  late AnimationController _controllerkelle;

  double bottomgovde = 0;
  double opacitygovde = 0;

  late Animation animationgovde;
  late AnimationController _controllergovde;


  @override
  void initState() {
    super.initState();
    _controllerbacak1 = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: delaymicroseconds),
    );

    animationbacak1 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controllerbacak1)
      ..addListener(() {
        setState(() {
          bottombacak1 = animationbacak1.value * 10;
          opacitybacak1 = animationbacak1.value;
        });
      });

    _controllerkol1 = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: delaymicroseconds),
    );

    animationkol1 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controllerkol1)
      ..addListener(() {
        setState(() {
          bottomkol1 = animationkol1.value * 10;
          opacitykol1 = animationkol1.value;
        });
      });

    _controllerkol2 = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: delaymicroseconds),
    );

    animationkol2 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controllerkol2)
      ..addListener(() {
        setState(() {
          bottomkol2 = animationkol2.value * 10;
          opacitykol2 = animationkol2.value;
        });
      });

    _controllerbacak2 = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: delaymicroseconds),
    );

    animationbacak2 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controllerbacak2)
      ..addListener(() {
        setState(() {
          bottombacak2 = animationbacak2.value * 10;
          opacitybacak2 = animationbacak2.value;
        });
      });

    _controllerkelle = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: delaymicroseconds),
    );

    animationkelle = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controllerkelle)
      ..addListener(() {
        setState(() {
          bottomkelle = animationkelle.value * 10;
          opacitykelle = animationkelle.value;
        });
      });


 _controllergovde = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: delaymicroseconds),
    );

    animationgovde = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controllergovde)
      ..addListener(() {
        setState(() {
          bottomgovde = animationgovde.value * 10;
          opacitygovde = animationgovde.value;
        });
      });

      
  }

  @override
  void dispose() {
    _controllerkol1.dispose();
    super.dispose();
  }

  void animate() {
    _controllerkol1.forward();
  }

  @override
  Widget build(BuildContext context) {
    double x = -180;
    double y = -100;
    if (widget.sayac > 4) {
      _controllerbacak1.forward();
    }
    if (widget.sayac > 3) {
      _controllerkol1.forward();
    }
    if (widget.sayac > 2) {
      _controllerkol2.forward();
    }
    if (widget.sayac > 5) {
      _controllerbacak2.forward();
    }
    if (widget.sayac > 0) {
      _controllerkelle.forward();
    }
    if (widget.sayac > 1) {
      _controllergovde.forward();
    }

    return Stack(
      children: [
        Positioned(
          top: y + 190 + bottombacak1,
          left: x + 65,
          child: Opacity(
            opacity: opacitybacak1,
            child: Image(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              image: const AssetImage("lib/assets/images/teladam/Line6.png"),
            ),
          ),
        ),
        Positioned(
          child: Image(
            color: const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/Line6.png"),
          ),
        ),
        Positioned(
          top: y + 190 + bottombacak2,
          left: x + 110,
          child: Opacity(
            opacity: opacitybacak2,
            child: Image(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              image: const AssetImage("lib/assets/images/teladam/Line5.png"),
            ),
          ),
        ),
        Positioned(
          top: y + 100 + bottomgovde,
          left: x + 270,
          child: Opacity(
            opacity: opacitygovde,
            child: Image(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              image: const AssetImage("lib/assets/images/teladam/Line4.png"),
            ),
          ),
        ),
        Positioned(
          top: y + 70 + bottomkol2,
          left: x + 100,
          child: Opacity(
            opacity: opacitykol2,
            child: Image(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              image: const AssetImage("lib/assets/images/teladam/Line3.png"),
            ),
          ),
        ),
        Positioned(
          top: y + 70 + bottomkol1,
          left: x + 40,
          child: Opacity(
            opacity: opacitykol1,
            child: Image(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              image: const AssetImage("lib/assets/images/teladam/Line2.png"),
            ),
          ),
        ),
        Positioned(
          top: y + bottomkelle,
          left: x,
          child: Opacity(
            opacity: opacitykelle,
            child: Image(
              color: const Color.fromARGB(255, 0, 0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              image: const AssetImage("lib/assets/images/teladam/kelle.png"),
            ),
          ),
        ),
      ],
    );
  }
}
