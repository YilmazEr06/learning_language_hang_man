import 'package:flutter/material.dart';
import 'package:hang_man/screens/gamepage/gamescreen.dart';
import 'package:hang_man/screens/levelpage/levelpage.dart';
import 'package:hang_man/screens/mainscreen/companents/dialog.dart';
import 'package:hang_man/screens/mainscreen/mainscreen.dart';
import 'package:hang_man/screens/scorpage/Scorpage.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
      '/changenamedialog':(context)=>CustomDialog(),
      '/selectlevelpage':(context)=>const Levelpage(),
      '/gamepage':(context)=>const Gamepage(),
      '/scorpage':(context)=>const Scorpage(),
    },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

