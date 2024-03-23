import 'package:flutter/material.dart';

class Textpart extends StatelessWidget {
  const Textpart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "lib/assets/stickman.png",
          fit: BoxFit.fill,
          scale: 1.5,
        ),
        const Text(
          "Dostum bize \n ismin lazım",
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }
}