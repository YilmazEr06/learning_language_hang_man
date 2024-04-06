import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/data_sources/dbhelper.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar/companents/leadingicon.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar/companents/skoricon.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar/companents/skorvalue.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar/companents/username.dart';
import 'package:hang_man/screens/settingsscreen/settings.dart';

class Userinfobar extends StatefulWidget {
  const Userinfobar({super.key});

  @override
  State<Userinfobar> createState() => UserinfobarState();
}

class UserinfobarState extends State<Userinfobar>
    with SingleTickerProviderStateMixin {
  late bool x;
  String name = "";
  int scor = 0;
  int uid = 12345;
  int level = 0;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() {
    x = Dbhelper().dbstatus;
    Data().getUserInfo().then((value) {
      setState(() {
        name = value["Users"]["username"];
        scor = value["Users"]["scor"];
        uid = value["Users"]["uid"];
        level = value["Users"]["level"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.95,
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
                Skorvalue(left: 120, top: 10, skor: scor),
                Username(left: 70, top: 38, name: name),
                x ? settingsicon(context, false) : settingsicon(context, true)
              ],
            )),
      ],
    );
  }

  Positioned settingsicon(BuildContext context, bool x) {
    return Positioned(
        top: 8,
        right: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Settings(
                        refresh: () {
                          getdata();
                        },
                      )),
            );
          },
          child: const Icon(
            Icons.settings_outlined,
            size: 50,
          ),
        ));
  }
}
