
import 'package:flutter/material.dart';

class Pageimage extends StatelessWidget {
  const Pageimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Image(image: AssetImage("lib/assets/page.png"));
  }
}