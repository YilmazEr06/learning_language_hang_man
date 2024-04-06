import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hang_man/screens/mainscreen/companents/bottomsheet/bottomsheet.dart';
import 'package:hang_man/screens/mainscreen/companents/buttons.dart';
import 'package:hang_man/screens/mainscreen/companents/page.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar/userinfobar.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //kullanıcı adı yoksa kullanıcı adı istenmesi
    islogin();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Builder(builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 245, 233, 146),
              child: const SafeArea(
                maintainBottomViewPadding: true,
                child: Stack(
                  children: [
                  Positioned(child: Userinfobar()),
                  Pageimage(),
                  Buttons(),
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }

  islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = !(sp.getString('name') == null);
    Timer(
      const Duration(milliseconds: 30),
      () {
        if (!isLogin == true) {
          if (mounted) {
            _scaffoldKey.currentState
                ?.showBottomSheet(
                  (BuildContext context) {
                    return const Bottomshet();
                  },
                )
                .closed
                .whenComplete(() {
                  islogin();
                });
          }
        }
      },
    );
  }
}
