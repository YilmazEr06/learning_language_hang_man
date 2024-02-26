import 'package:flutter/material.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';

class Levelpage extends StatefulWidget {
  const Levelpage({super.key});

  @override
  State<Levelpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Levelpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 245, 233, 146),
        child: const SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                userinfobar(),
                catagoryfield(head: "Bilim"),
                cards(),
                catagoryfield(head: "Bilim"),
                cards(),
                catagoryfield(head: "Bilim"),
                cards(),
                catagoryfield(head: "Bilim"),
                cards(),
                catagoryfield(head: "Bilim"),
                cards(),
                catagoryfield(head: "Bilim"),
                cards()
              ]),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class cards extends StatelessWidget {
  const cards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
          card(),
        ],
      ),
    );
  }
}

class card extends StatelessWidget {
  const card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: SizedBox(
        height: 175,
        width: 175,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("lib/assets/math.png"), fit: BoxFit.fill)),
          child: const Stack(
            children: [
              Positioned(
                  top: 65,
                  left: 10,
                  child: Text(
                    "Matematik",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 95,
                  left: 12,
                  child: Text(
                    "1500 kelime",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 254, 11, 11)),
                  )),
              Positioned(
                  top: 110,
                  left: 10,
                  child: Text(
                    "%50 tamamlandı",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 1, 1)),
                  )),
              Positioned(
                  top: 125,
                  left: 10,
                  child: Text(
                    "3 seviye mevcut",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 8, 8)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class catagoryfield extends StatelessWidget {
  const catagoryfield({
    super.key,
    required this.head,
  });

  final String head;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: 100,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
            ),
            child: Center(
                child: Text(
              head,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ))),
      ),
    );
  }
}
