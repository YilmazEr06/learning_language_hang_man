import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/gamepage/companents/adam.dart';
import 'package:hang_man/screens/gamepage/companents/deadialog.dart';
import 'package:hang_man/screens/gamepage/companents/field.dart';

class Gamepaper extends StatefulWidget {
  const Gamepaper({
    super.key,
    required this.arguments,
    required this.passedbuttons,
    required this.opacity,
    required this.bottom,
    required this.increasescor,
  });
  final List<WordModel> arguments;
  final List passedbuttons;
  final double opacity;
  final double bottom;
  final VoidCallback increasescor;
  @override
  State<Gamepaper> createState() => PageState();
}

class PageState extends State<Gamepaper> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Field> fields = [];
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
    for (var x in words) {
      int known = 0;
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
        //Bütün harfler bilinmişşe
        if (widget.passedbuttons.contains(i)) {
          known = known + 1;

          if (known == x.length) {
            widget.increasescor();
            if (index == widget.arguments.length - 1) {
              //oyun sonu
            } else {
              //kelimenn bilinmesi durumu

              setState(() {
                index = index + 1;
                known = 0;
              });
            }
            widget.passedbuttons.clear();
          }
        }
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: fields,
      ));
    }

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
          top: MediaQuery.of(context).size.height * 0.10 - widget.bottom,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Opacity(
            opacity: widget.opacity,
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
            ),
          )),
      Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.35 - widget.bottom + 20,
          child: Opacity(
            opacity: widget.opacity,
            child: Container(
              color: const Color.fromARGB(0, 33, 149, 243),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rows,
              ),
            ),
          )),
    ]);
  }

  preparedwords(List<String> words, double size, List<Field> fields,
      List<Row> rows, int index) {
    for (var x in words) {
      int known = 0;
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
        //Bütün harfler bilinmişşe
        if (widget.passedbuttons.contains(i)) {
          known = known + 1;

          if (known == x.length) {
            if (index > widget.arguments.length - 1) {
            } else {
              setState(() {
                index = index + 1;
              });
            }
          }
        }
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: fields,
      ));
    }
  }
}
