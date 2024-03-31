import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hang_man/screens/scorpage/companents/Scorinfobar.dart';
import 'package:hang_man/screens/scorpage/companents/catagoryrow.dart';
import 'package:hang_man/screens/scorpage/companents/userlistcolumn/userlistcolumn.dart';

class Scorpage extends StatefulWidget {
  const Scorpage({super.key});
  @override
  State<Scorpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Scorpage> {
  String category = "hepsi";
  void changecategory(String category) {
    setState(() {
      this.category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: SafeArea(
            child: Column(children: [
              const ScorInfoBar(),
              Catagoryrow(callback: changecategory, currentcatagory: category),
              Userlistcolumn(catagory: category)
            ]),
          ),
        ),
      ),
    ));
  }
}
