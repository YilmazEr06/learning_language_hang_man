import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/data_sources/dbhelper.dart';
import 'package:hang_man/screens/gamepage/companents/settingsdialog.dart';
import 'package:stroke_text/stroke_text.dart';

class Userinfobar extends StatefulWidget {
  const Userinfobar({super.key});

  @override
  State<Userinfobar> createState() => UserinfobarState();
}

class UserinfobarState extends State<Userinfobar> {
  late bool x;
  String name = "";
  int scor = 0;
  int uid = 12345;
  int level = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      x = Dbhelper().dbstatus;
      Data().getUserInfo().then((value) {
        setState(() {
          name = value["Users"]["username"];
          scor = value["Users"]["scor"];
          uid = value["Users"]["uid"];
          level = value["Users"]["level"];
        });
      });
    });
  }

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
                const Leadingicon(left: 10, top: 7.5),
                const Skoricon(
                  left: 65,
                  top: 5,
                ),
                 Skorvalue(left: 120, top: 10,skor: scor),
                Username(left: 70, top: 38, name: name),
                x ? settingsicon(context, false) : settingsicon(context, true)
              ],
            )),
      ),
    );
  }

  Positioned settingsicon(BuildContext context, bool x) {
   

    return Positioned(
        top: 8,
        right: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          barrierDismissible: true,
          pageBuilder: (BuildContext context, _, __) {
            return const Settingdialog();
          }));
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
      child: const  CircleAvatar(
        radius: 28,
        backgroundColor: Color.fromARGB(255, 240, 200, 21),
        child: Icon(
          size: 50,
          Icons.account_circle_outlined,
          fill: 1,
        ),
      ),
    );
  }
}
