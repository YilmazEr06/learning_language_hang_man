import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/firebase.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/gamepage/companents/adam.dart';
import 'package:hang_man/screens/gamepage/companents/deadialog.dart';
import 'package:hang_man/screens/gamepage/companents/field.dart';
import 'package:hang_man/screens/gamepage/companents/klavye.dart';
import 'package:hang_man/screens/gamepage/companents/userinfobar.dart';





class Gamepage extends StatefulWidget {
  const Gamepage({super.key});
  @override
  State<Gamepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Gamepage> {
  @override
  void initState() {
    super.initState();
    Firebasehlp().getcatagories();
  }

  List passedbuttons = [];
  @override
  Widget build(BuildContext context) {
    List<WordModel> arguments =
        ModalRoute.of(context)?.settings.arguments as List<WordModel>;

    addpassedbuttons(String x) {
      setState(() {
        if (!passedbuttons.contains(x)) {
          passedbuttons.add(x);
          passedbuttons = passedbuttons;
        }
      });
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(children: [
             const Userinfobar(),
              Gamepaper(arguments: arguments, passedbuttons: passedbuttons),
              Klavye(
                passedbuttons: addpassedbuttons,
              )
            ]),
          ),
        ),
      ),
    ));
  }
}

class Gamepaper extends StatefulWidget {
  const Gamepaper({
    super.key,
    required this.arguments,
    required this.passedbuttons,
  });
  final List<WordModel> arguments;
  final List passedbuttons;
  @override
  State<Gamepaper> createState() => PageState();
}

class PageState extends State<Gamepaper> {
  @override
  Widget build(BuildContext context) {
    List<Field> fields = [];
    int index = 0;
    double size = 25;
    List<String> words = widget.arguments[index].name.split(" ");
    List<Row> rows = [];
    int sayac = 0;
    for (String i in widget.passedbuttons) {
      if (!widget.arguments[index].name.contains(i)) {
        setState(() {
          sayac = sayac + 1;
        });
        if (sayac == 6) {
          sayac = sayac + 1;
          Timer(const Duration(seconds: 1), () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                barrierDismissible: false,
                pageBuilder: (BuildContext context, _, __) {
                  return Deadialog();
                }));
          });
        }
      }
    }
    preparedwords(words, size, fields, rows);
    return Stack(children: [
      Positioned(
        child: Image(
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/images/page.png")),
      ),
      Positioned(
        top: -85,
        child: Row(
          children: [
            Buildadam(sayac: sayac),
          ],
        ),
      ),
      Positioned(
          left: MediaQuery.of(context).size.width * 0.4,
          top: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width * 0.5,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.arguments[index].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
          )),
      Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.35,
          child: Container(
            color: const Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rows,
            ),
          )),
    ]);
  }

  void preparedwords(
      List<String> words, double size, List<Field> fields, List<Row> rows) {
    for (var x in words) {
      if (x.length > 6) {
        if (size > (6 * 24) / x.length) size = (6 * 24) / x.length;
      }
      fields = [];
      for (String i in x.characters) {
        fields.add(Field(
          x: i.toUpperCase(),
          size: size,
          visible: widget.passedbuttons.contains(i) ? false : true,
        ));
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: fields,
      ));
    }
  }
}
