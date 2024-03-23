import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/data_sources/dbhelper.dart';
import 'package:hang_man/screens/gamepage/companents/userinfobar.dart';


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






