import 'package:flutter/material.dart';
import 'package:hang_man/screens/scorpage/companents/Scorinfobar.dart';
import 'package:hang_man/screens/scorpage/companents/catagoryrow.dart';
import 'package:hang_man/screens/scorpage/companents/userlistcolumn.dart';
import 'package:stroke_text/stroke_text.dart';

class Scorpage extends StatefulWidget {
  const Scorpage({super.key});

  @override
  State<Scorpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Scorpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: const Column(children: [
            SizedBox(
              height: 15,
            ),
            Scorinfobar(),
            catagoryrow(),
            userlistcolumn()
          ]),
        ),
      ),
    ));
  }
}

