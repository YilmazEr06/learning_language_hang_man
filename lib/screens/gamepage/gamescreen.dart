import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/firebase.dart';
import 'package:hang_man/models/word.dart';
import 'package:hang_man/screens/gamepage/companents/field.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';
import 'companents/klavye.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  State<Gamepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Gamepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebasehlp().getcatagories();
    
  }
List passedbuttons = [];
  @override
  Widget build(BuildContext context) {
    List<WordModel> arguments =
        ModalRoute.of(context)?.settings.arguments as List<WordModel>;
    
    addpassedbuttons(String x){
     setState(() {
       passedbuttons.add(x);
       passedbuttons= passedbuttons;
       print(passedbuttons);
     });
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            const userinfobar(),
            page(arguments: arguments, passedbuttons: passedbuttons),
            buttons(
              passedbuttons: addpassedbuttons,
            )
          ]),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class page extends StatefulWidget {
  const page({
    super.key,
    required this.arguments,
    required this.passedbuttons,
  });
  final List<WordModel> arguments;
  final List passedbuttons;

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  @override
  Widget build(BuildContext context) {
    List<field> fields = [];
    int index = 0;
    double size = 25;
    List<String> words = widget.arguments[index].name.split(" ");
    List<Row> rows = [];

    for (var x in words) {
      if (x.length > 6) {
        if (size > (6 * 24) / x.length) size = (6 * 24) / x.length;
      }
      fields = [];
      for (String i in x.characters) {
        fields.add(field(
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
    return Stack(children: [
      Positioned(
        child: Image(
            height: MediaQuery.of(context).size.height * 0.65,
            image: const AssetImage("lib/assets/page.png")),
      ),
      Positioned(
        top: -85,
        child: Row(
          children: [
            Image(
                height: MediaQuery.of(context).size.height * 0.65,
                image: const AssetImage("lib/assets/ADAM.png")),
          ],
        ),
      ),
      Positioned(
          left: MediaQuery.of(context).size.width * 0.4,
          top: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.arguments[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
              children: rows,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )),
    ]);
  }
}
