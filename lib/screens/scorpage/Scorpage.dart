import 'package:flutter/material.dart';
import 'package:hang_man/screens/scorpage/companents/Scorinfobar.dart';
import 'package:hang_man/screens/scorpage/companents/catagoryrow.dart';
import 'package:hang_man/screens/scorpage/companents/userlistcolumn/userlistcolumn.dart';


class Scorpage extends StatefulWidget {
  const Scorpage({super.key});
  @override
  State<Scorpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Scorpage> {
  String category = "Hepsi";
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
          child:  Column(children: [
            const SizedBox(
              height: 15,
            ),
            const ScorInfoBar(),
            Catagoryrow(callback: changecategory,currentcatagory: category),
            Userlistcolumn(catagory: category,)
          ]),
        ),
      ),
    ));
  }
}
