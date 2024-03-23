import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Levelspar extends StatefulWidget {
  const Levelspar({super.key});

  @override
  State<Levelspar> createState() => UserinfobarState();
}

class UserinfobarState extends State<Levelspar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 10,
        right: 10,
        bottom: 10
      ),
      child: Container(
          alignment: Alignment.center,
          height: 70,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 247, 213, 1),
            borderRadius: BorderRadius.all(Radius.elliptical(64, 64)),
          ),
          child: const Center(
            child: Text("Levels",style:  TextStyle(fontSize: 35)),
          )),
    );
  }

  Positioned settingsicon(BuildContext context, bool x) {

    return Positioned(
        top: 8,
        right: 15,
        child: GestureDetector(
          onTap: () {
             Navigator.of(context).pushNamed('/settings');
          },
          child: const Icon(
            Icons.settings_outlined,
            size: 50,
          ),
        ));
  }
}

class Username extends StatelessWidget {
  const Username(
      {super.key, required this.left, required this.top, required this.name});
  final double left;
  final double top;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ));
  }
}

class Skoricon extends StatelessWidget {
  const Skoricon({
    super.key,
    required this.left,
    required this.top,
  });
  final double left;
  final double top;
  @override
  Widget build(BuildContext context) {
    return const Positioned(
        top: 5,
        left: 65,
        child: Image(
            height: 35,
            fit: BoxFit.fill,
            image: AssetImage("lib/assets/skor.png")));
  }
}

class Skorvalue extends StatelessWidget {
  const Skorvalue({
    super.key,
    required this.left,
    required this.top,
    required this.skor,
  });
  final int skor;
  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child:  StrokeText(
          text: skor.toString(),
          strokeWidth: 2.5,
          strokeColor: Colors.black,
          textStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}

class Leadingicon extends StatelessWidget {
  const Leadingicon({super.key, required this.left, required this.top});

  final double left;
  final double top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: const CircleAvatar(
        radius: 28,
        backgroundColor: Color.fromARGB(255, 240, 200, 21),
        child: Stack(
          children: [
            Positioned(
              top: 2.5,
              left: -1.5,
              child: Image(
                height: 58,
                alignment: Alignment.center,
                image: AssetImage("lib/assets/Usericon.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
