import 'package:flutter/material.dart';
import 'package:hang_man/screens/mainscreen/companents/userinfobar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Positioned(
        child: Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Image(image: AssetImage("lib/assets/start.png"))),
        SizedBox(
          height: 6,
        ),
        Image(image: AssetImage("lib/assets/skortable.png"))
      ],
    ));
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
