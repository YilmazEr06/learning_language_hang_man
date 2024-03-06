import 'package:shared_preferences/shared_preferences.dart';

class Shared_preferences{

SharedPreferences? prefs;
 
Future get srfcs async {
    prefs = await SharedPreferences.getInstance();


}

Future  setuserid ( String id)async {
   prefs = await SharedPreferences.getInstance();
   await prefs!.setString('id', id);
}

}