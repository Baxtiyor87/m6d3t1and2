
import 'package:shared_preferences/shared_preferences.dart';

class PrefService{

  static storeName(String name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("name", name);

  }

  static Future<String?> loadName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");

  }

  static Future<bool?> removeName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");

  }

}