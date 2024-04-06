import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Skoricon extends StatelessWidget {
  const Skoricon({
    super.key,
    required this.left,
    required this.top,
  });
  final double left;
  final double top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5,
        left: 65,
        child: Text("Skor:"));
  }
}
