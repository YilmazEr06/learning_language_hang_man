import 'package:flutter/material.dart';

class Leadingicon extends StatelessWidget {
  const Leadingicon({super.key, required this.left, required this.top});

  final double left;
  final double top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: const CircleAvatar(
        radius: 28,
        backgroundColor: Color.fromARGB(255, 240, 200, 21),
        child: Stack(
          children: [
            Positioned(
              top: 2.5,
              left: -1.5,
              child: Image(
                height: 58,
                alignment: Alignment.center,
                image: AssetImage("lib/assets/Usericon.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}