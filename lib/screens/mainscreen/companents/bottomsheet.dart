import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/shared_preferences.dart';

class bottomshet extends StatefulWidget {
  const bottomshet({
    super.key,
  });

  @override
  State<bottomshet> createState() => _bottomshetState();
}

class _bottomshetState extends State<bottomshet> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();

    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 242, 188),
            borderRadius: BorderRadius.circular(20)),
        height: 400,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/stickman.png",
                      fit: BoxFit.fill,
                      scale: 1.5,
                    ),
                    Text(
                      "Dostum bize \n ismin lazım",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
                textfield(
                  controller: controller,
                ),
                button(
                  formKey: _formKey,
                  controller: controller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Shared_preferences().prefs;
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
            Shared_preferences().setusername(controller.text).then((value) {
              Shared_preferences().setuserrandomid();
              Navigator.pop(context);
              Timer(Duration(milliseconds: 5), () {
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

class textfield extends StatelessWidget {
  const textfield({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.length < 5) {
            return "Biraz daha fazla karakterin olsun";
          }
        },
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: TextStyle(),
      ),
    );
  }
}
