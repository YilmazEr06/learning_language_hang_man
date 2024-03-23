
import 'package:flutter/material.dart';

class Username extends StatelessWidget {
  const Username(
      {super.key, required this.left, required this.top, required this.name});
  final double left;
  final double top;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ));
  }
}