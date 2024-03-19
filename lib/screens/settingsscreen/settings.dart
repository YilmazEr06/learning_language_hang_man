import 'package:flutter/material.dart';

import 'package:hang_man/screens/settingsscreen/companents/appbar.dart';
import 'package:hang_man/screens/settingsscreen/companents/keyboardsoundslider.dart';
import 'package:hang_man/screens/settingsscreen/companents/sounslider.dart';
import 'package:hang_man/screens/settingsscreen/companents/userid.dart';
import 'package:hang_man/screens/settingsscreen/companents/username.dart';
import 'package:hang_man/screens/settingsscreen/companents/userphoto.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<settings> {
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
              appbar(),
              userphoto(),
              username(),
              userid(context),
              slidersound(),
              keyboardsound(),
            ],
          ),
        ),
      ),
    );
  }
}

