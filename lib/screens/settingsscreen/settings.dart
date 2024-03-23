import 'package:flutter/material.dart';
import 'package:hang_man/screens/settingsscreen/companents/appbar.dart';
import 'package:hang_man/screens/settingsscreen/companents/keyboardsoundslider.dart';
import 'package:hang_man/screens/settingsscreen/companents/sounslider.dart';
import 'package:hang_man/screens/settingsscreen/companents/userid.dart';
import 'package:hang_man/screens/settingsscreen/companents/username.dart';
import 'package:hang_man/screens/settingsscreen/companents/userphoto.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<Settings> {
  late double slidersoundvalue;
  late double sliderkeyboardsoundvalue;
  

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
              const Appbar(),
              const Userphoto(),
              const Username(),
              userid(context),
              const Slidersound(),
              const Keyboardsound(),
            ],
          ),
        ),
      ),
    );
  }
}

