import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Skorvalue extends StatelessWidget {
  const Skorvalue({
    super.key,
    required this.left,
    required this.top,
    required this.skor,
  });
  final int skor;
  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child:  StrokeText(
          text: skor.toString(),
          strokeWidth: 2.5,
          strokeColor: Colors.black,
          textStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}
