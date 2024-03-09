import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    islogin();

  }

  islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = !(sp.getString('id')==null);
    Timer(
      const Duration(
      microseconds: 1,
      ),
      () {
        if (isLogin) {
          print("Giriş yapılmış");
        
        } else {
          print("Giriş yapılmamış");
          Navigator.pushNamed(context, '/changenamedialog');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: const Column(children: [
            SizedBox(
              height: 15,
            ),
            userinfobar(),
            page(),
            buttons()
          ]),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
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
      children: [ Positioned(
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
              child: const Image(image: AssetImage("lib/assets/skortable.png")))
        ],
      )),],
   
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
