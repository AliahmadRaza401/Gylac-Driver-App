import 'package:shared_preferences/shared_preferences.dart';

class  SharedPrefServices {
   // user Logged
  static userLoggedIn(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userLoggedIn', value);
  }

// get user LoggedIn value
  static getUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? boolValue = prefs.getBool('userLoggedIn');
    return boolValue;
  }
}