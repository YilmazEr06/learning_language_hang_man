import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hang_man/screens/wordview/companents/wordview/wordview.dart';
import 'package:hang_man/screens/wordview/companents/wordviewbar.dart';

class Wordviewpage extends StatefulWidget {
  const Wordviewpage({super.key});
  @override
  State<Wordviewpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Wordviewpage> {
  List arguments = [];
  List levels = [];
  @override
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 245, 233, 146),
              child: SafeArea(
                  maintainBottomViewPadding: true,
                  child: Column(
                    children: [
                      const Wordviewbar(), Wordview(arguments: arguments)],)),
        ),
      ),
    ));
  }
}
