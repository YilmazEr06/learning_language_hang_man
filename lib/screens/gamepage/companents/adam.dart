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

class BuildadamState extends State<Buildadam> {
  @override
  Widget build(BuildContext context) {
    double x = -180;
    double y = -90;
    return Stack(
      children: [
        Positioned(
          top: y + 190,
          left: x + 65,
          child: Image(
            color: (widget.sayac>4)?const Color.fromARGB(255, 0, 0, 0):const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/Line6.png"),
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
         top: y + 190,
          left: x + 110,
          child: Image(
            color: (widget.sayac>5)?const Color.fromARGB(255, 0, 0, 0):const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/Line5.png"),
          ),
        ),
        Positioned(
          top: y + 100,
          left: x + 270,
          child: Image(
            color: (widget.sayac>1)?const Color.fromARGB(255, 0, 0, 0):const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/Line4.png"),
          ),
        ),
        Positioned(
          top: y + 70,
          left: x + 100,
          child: Image(
            color: (widget.sayac>2)?const Color.fromARGB(255, 0, 0, 0):const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/Line3.png"),
          ),
        ),
        Positioned(
          top: y + 70,
          left: x + 40,
          child: Image(
            color: (widget.sayac>3)?const Color.fromARGB(255, 0, 0, 0):const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/Line2.png"),
          ),
        ),
        Positioned(
          top: y,
          left: x,
          child: Image(
            color: (widget.sayac>0)?const Color.fromARGB(255, 0, 0, 0):const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/teladam/kelle.png"),
          ),
        ),
      ],
    );
  }
}
