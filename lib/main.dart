import 'package:flutter/material.dart';
import 'package:hang_man/screens/gamepage/gamescreen.dart';
import 'package:hang_man/screens/catagorypage/catagorypage.dart';
import 'package:hang_man/screens/levelpage/levelpage.dart';
import 'package:hang_man/screens/mainscreen/companents/dialog.dart';
import 'package:hang_man/screens/mainscreen/mainscreen.dart';
import 'package:hang_man/screens/scorpage/Scorpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hang_man/screens/wordview/wordviewpage.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      '/selectCatagorypage':(context)=>const Catagorypage(),
      '/gamepage':(context)=>const Gamepage(),
      '/scorpage':(context)=>const Scorpage(),
      '/selectlevelpage':(context)=>const Levelpage(),
      '/wordview':(context)=>const Wordviewpage(),
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

