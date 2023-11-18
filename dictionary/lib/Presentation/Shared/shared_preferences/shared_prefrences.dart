import 'package:shared_preferences/shared_preferences.dart';

class CacheData{
  static late SharedPreferences sharedPreferences;
  ///declare
  static Future<void> cacheInitialization() async {
    sharedPreferences= await SharedPreferences.getInstance();

  }
  //methods:
  ///1. set:
  static Future<bool> setData({required String key, required dynamic value})async
  {
    if( value is bool)
    {
      print(value is bool);
      return await sharedPreferences.setBool(key, value);
    }
    return false;

  }
  ///2. get:
  static dynamic getData({required String key})
  {
    return sharedPreferences.get(key);
  }
}