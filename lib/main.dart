import 'package:flutter/material.dart';
import 'package:hang_man/screens/gamepage/gamescreen.dart';
import 'package:hang_man/screens/levelpage/gamescreen.dart';
import 'package:hang_man/screens/mainscreen/companents/dialog.dart';



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
      '/selectlevelpage':(context)=>const Gamepage(),
    },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Levelpage(),
    );
  }
}

