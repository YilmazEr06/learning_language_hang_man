import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hang_man/bloc/databloc.dart';
import 'package:hang_man/screens/settingsscreen/companents/appbar.dart';
import 'package:hang_man/screens/settingsscreen/companents/keyboardsoundslider.dart';
import 'package:hang_man/screens/settingsscreen/companents/sounslider.dart';
import 'package:hang_man/screens/settingsscreen/companents/userid.dart';
import 'package:hang_man/screens/settingsscreen/companents/username.dart';
import 'package:hang_man/screens/settingsscreen/companents/userphoto.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, required this.refresh});
  final VoidCallback refresh ;
  @override
  State<Settings> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<Settings>
    with TickerProviderStateMixin {
  late double slidersoundvalue;
  late double sliderkeyboardsoundvalue;

  double height = 10;
  double opacity = 0;

  late Animation _moveanimation;
  late AnimationController _controllermove;

  late Animation _opacityanimation;
  late AnimationController _controlleropacity;

  String name = "";
  int scor = 0;
  int uid = 12345;
  int level = 0;
  String avatar = "1";

  @override
  void initState() {
    super.initState();
    _controllermove = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controllermove.addListener(() {
      setState(() {
        height = _moveanimation.value;
      });
    });

    _controlleropacity = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _controlleropacity.addListener(() {
      setState(() {
        opacity = _opacityanimation.value;
      });
    });
   getuserinfo();
    Timer(const Duration(milliseconds: 1), () {
      animate();
    });
  }

  getuserinfo() {
    Data().getUserInfo().then((value) {
      setState(() {
        name = value["Users"]["username"];
        scor = value["Users"]["scor"];
        uid = value["Users"]["uid"];
        level = value["Users"]["level"];
        avatar = value["Users"]["avatar"];
      });
    });
  }

  void animate() {
    _moveanimation = _controllermove.drive(
      Tween<double>(
        begin: 10,
        end: 0,
      ),
    );
    _controllermove.reset();
    _controllermove.forward();

    _opacityanimation = _controlleropacity.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );
    _controlleropacity.reset();
    _controlleropacity.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controllermove.dispose();
    _controlleropacity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDDB9A),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Appbar(
                text: "ayarlar",
              ),
              SizedBox(
                height: height,
              ),
              Opacity(
                opacity: opacity,
                child: Column(
                  children: [
                    Userphoto(
                      avatar: avatar,
                      refresh: () {
                        setState(() {
                          getuserinfo();
                        });
                      },
                    ),
                    Username(username: name, refresh:widget.refresh),
                    userid(context, uid.toString()),
                    const Slidersound(),
                    const Keyboardsound(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
