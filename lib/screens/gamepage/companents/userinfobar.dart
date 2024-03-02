import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/data_sources/dbhelper.dart';
import 'package:hang_man/screens/mainscreen/companents/dialog.dart';
import 'package:stroke_text/stroke_text.dart';

class userinfobar extends StatefulWidget {
  const userinfobar({
    super.key,
  });

  @override
  State<userinfobar> createState() => _userinfobarState();
}

class _userinfobarState extends State<userinfobar> {
 
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Hero(
        tag: "hero-tag",
        child: Container(
            alignment: Alignment.center,
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 247, 213, 1),
              borderRadius: BorderRadius.all(Radius.elliptical(64, 64)),
            ),
            child: Stack(
              children: [
                const leadingicon(left: 10, top: 7.5),
                const skoricon(
                  left: 65,
                  top: 5,
                ),
                const skorvalue(left: 120, top: 10),
                 username(
                  left: 70,
                  top: 38,
                 
                ),
                settingsicon(context)
              ],
            )),
      ),
    );
  }

  Positioned settingsicon(BuildContext context) {
    return Positioned(
        top: 8,
        right: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                barrierDismissible: true,
                pageBuilder: (BuildContext context, _, __) {
                  return Container(child: CustomDialog());
                }));
          },
          child: const Icon(
            Icons.settings_outlined,
            size: 50,
          ),
        ));
  }
}


class username extends StatelessWidget {
  const username({
    super.key,
    required this.left,
    required this.top,
    
  });
  
  final double left;
  final double top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child:  Text(
         "PLAyer#123",
          style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ));
  }
}

class skoricon extends StatelessWidget {
  const skoricon({
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

class skorvalue extends StatelessWidget {
  const skorvalue({
    super.key,
    required this.left,
    required this.top,
  });

  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: const StrokeText(
          text: "123456789",
          strokeWidth: 2.5,
          strokeColor: Colors.black,
          textStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ));
  }
}

class leadingicon extends StatelessWidget {
  const leadingicon({super.key, required this.left, required this.top});

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
