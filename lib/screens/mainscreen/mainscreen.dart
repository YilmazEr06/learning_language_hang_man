import 'dart:async';
import 'package:flutter/material.dart';

import 'package:hang_man/screens/mainscreen/companents/bottomsheet.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';
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
    islogin();
  }

  islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = !(sp.getString('name') == null);
    Timer(
      const Duration(milliseconds: 30),
      () {
        if (isLogin == true) {
          print("Giriş yapılmış");
          
         
        } else {
           if (mounted) {
            _scaffoldKey.currentState?.showBottomSheet(


              (BuildContext context) {
            
              return const bottomshet();
            },
            ).closed.whenComplete(() {
              islogin();
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Builder(builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height,
              color: const Color.fromARGB(255, 245, 233, 146),
              child: Column(children: [
                SizedBox(
                  height: 15,
                ),
                userinfobar(),
                page(),
                buttons(),
              ]),
            );
          }),
        ),
      ),
    );
  }
}

class buttons extends StatelessWidget {
  const buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/selectCatagorypage');
                },
                child: const Image(image: AssetImage("lib/assets/start.png"))),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/scorpage');
                },
                child:
                    const Image(image: AssetImage("lib/assets/skortable.png")))
          ],
        )),
      ],
    );
  }
}

class page extends StatelessWidget {
  const page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Image(image: AssetImage("lib/assets/page.png")),
    );
  }
}
