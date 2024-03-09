import 'package:flutter/material.dart';

class buildadam extends StatefulWidget {
  const buildadam({
    super.key,
    required this.sayac,
  });
  final int sayac;

  @override
  State<buildadam> createState() => _buildadamState();
}

class _buildadamState extends State<buildadam> {
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
            color: (widget.sayac>4)?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/Line6.png"),
          ),
        ),
        Positioned(
          child: Image(
            color: const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/Line6.png"),
          ),
        ),
        Positioned(
         top: y + 190,
          left: x + 110,
          child: Image(
            color: (widget.sayac>5)?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/Line5.png"),
          ),
        ),
        Positioned(
          top: y + 100,
          left: x + 270,
          child: Image(
            color: (widget.sayac>1)?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/Line4.png"),
          ),
        ),
        Positioned(
          top: y + 70,
          left: x + 100,
          child: Image(
            color: (widget.sayac>2)?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/Line3.png"),
          ),
        ),
        Positioned(
          top: y + 70,
          left: x + 40,
          child: Image(
            color: (widget.sayac>3)?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/Line2.png"),
          ),
        ),
        Positioned(
          top: y,
          left: x,
          child: Image(
            color: (widget.sayac>0)?Color.fromARGB(255, 0, 0, 0):Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.65,
            image: AssetImage("lib/assets/kelle.png"),
          ),
        ),
      ],
    );
  }
}
