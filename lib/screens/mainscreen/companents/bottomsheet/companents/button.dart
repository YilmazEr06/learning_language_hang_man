import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/shared_preferences.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Sharedpreferences().prefs;
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 244, 155, 54)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 244, 155, 54))))),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Sharedpreferences().setusername(controller.text).then((value) {
              Sharedpreferences().setuserrandomid();
              Navigator.pop(context);
              Timer(const Duration(milliseconds: 5), () {
                Navigator.pushReplacementNamed(context, "/main");
              });
            });
          }
        },
        child: const SizedBox(
          height: 50,
          width: 150,
          child: Center(
              child: Text(
            "DEVAM!!",
            style: TextStyle(fontSize: 25),
          )),
        ));
  }
}