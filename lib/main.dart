import 'package:flutter/material.dart';
import 'package:hang_man/screens/changeavatar/avatar.dart';
import 'package:hang_man/screens/gamepage/companents/deadialog.dart';
import 'package:hang_man/screens/gamepage/gamescreen.dart';
import 'package:hang_man/screens/catagorypage/catagorypage.dart';
import 'package:hang_man/screens/levelpage/levelpage.dart';
import 'package:hang_man/screens/mainscreen/mainscreen.dart';
import 'package:hang_man/screens/scorpage/scorpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hang_man/screens/settingsscreen/settings.dart';
import 'package:hang_man/screens/splashscreen/splash.dart';
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
      '/selectCatagorypage':(context)=>const Catagorypage(),
      '/gamepage':(context)=>const Gamepage(),
      '/scorpage':(context)=>const Scorpage(),
      '/selectlevelpage':(context)=>const Levelpage(),
      '/wordview':(context)=>const Wordviewpage(),
      '/deaddialog':(context)=>Deadialog(),
      '/main':(context)=>const MyHomePage(),

   
      
    },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

