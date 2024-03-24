import 'package:flutter/material.dart';
import 'package:hang_man/screens/levelpage/companents/levellist/levellist.dart';
import 'package:hang_man/screens/levelpage/companents/levelsbar.dart';

class Levelpage extends StatefulWidget {
  const Levelpage({super.key});
  @override
  State<Levelpage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Levelpage> {
  List arguments = [];
  @override
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)?.settings.arguments as List;
    List<ListTile> list = [];
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 245, 233, 146),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: [
                const Levelspar(),
                Levellist(arguments: arguments, list: list),
              ],
            ),
          ),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
