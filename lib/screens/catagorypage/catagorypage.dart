import 'package:flutter/material.dart';
import 'package:hang_man/screens/catagorypage/companents/cards.dart';
import 'package:hang_man/screens/catagorypage/companents/catagoryfield.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';




class Catagorypage extends StatefulWidget {
  const Catagorypage({super.key});

  @override
  State<Catagorypage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Catagorypage> {
  String category = "";

  @override
  void initState() {
    super.initState();
    category = "Hepsi";
    changecategory(category);
  }

  void changecategory(String category) {
    setState(() {
      print("object");
      print(category);
      this.category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const userinfobar(),
                CategoryFields(callback: changecategory,currentcatagory: category),
                cards(catagory: category),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



