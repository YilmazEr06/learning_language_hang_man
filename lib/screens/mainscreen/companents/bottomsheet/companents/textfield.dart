

import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.length < 5) {
            return "Biraz daha fazla karakterin olsun";
          }
          else{
            return null;
          }
        },
        decoration: const InputDecoration(border: OutlineInputBorder()),
        style: const TextStyle(),
      ),
    );
  }
}
