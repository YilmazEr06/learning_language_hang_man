import 'package:flutter/material.dart';
import 'package:hang_man/data_sources/firebase.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';




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
            userinfobar(),
            page(),
            buttons()
          ]),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class buttons extends StatelessWidget {
  const buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          button(text: "Q"),
          button(text: "W"),
          button(text: "E"),
          button(text: "R"),
          button(text: "T"),
          button(text: "Y"),
          button(text: "U"),
          button(text: "I"),
          button(text: "O"),
          button(text: "P"),
          button(text: "Ğ"),
          button(text: "Ü"),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          button(text: "A"),
          button(text: "S"),
          button(text: "D"),
          button(text: "F"),
          button(text: "G"),
          button(text: "H"),
          button(text: "J"),
          button(text: "K"),
          button(text: "L"),
          button(text: "Ş"),
          button(text: "İ"),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          button(text: "Z"),
          button(text: "X"),
          button(text: "C"),
          button(text: "V"),
          button(text: "B"),
          button(text: "N"),
          button(text: "M"),
          button(text: "Ö"),
          button(text: "Ç"),
        ]),
      ],
    );
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5),
      child: SizedBox(
        height: 46,
        width: 29,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 170, 167, 166)),
            child: Center(child: Text(text))),
      ),
    );
  }
}

class page extends StatelessWidget {
  const page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit.",
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
            color: Color.fromARGB(0, 33, 149, 243),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Row(children: [
              field(x: "A"),
              field(x: "B"),
              field(x: "A"),
              field(x: "B"),
              field(x: "A"),
              field(x: "A"),
            ]),
          )),
    ]);
  }
}

class field extends StatelessWidget {
  const field({
    super.key,
    required this.x,
  });
  final String x;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 75,
        width: 50,
        child: Container(
          color: Color.fromARGB(0, 255, 193, 7),
          child: Center(
              child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 20,
                  child: Text(
                    x,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 30,
                  child:
                      Container(child: Image.asset("lib/assets/underline.png")))
            ],
          )),
        ),
      ),
    );
  }
}
