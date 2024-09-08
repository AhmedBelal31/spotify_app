import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  // // Lazy Singleton instance
  // static SharedPreferenceHelper? _instance;
  // SharedPreferences? _preferences;
  //
  // // Private constructor
  // SharedPreferenceHelper._internal();
  //
  // // Factory constructor for lazy initialization
  // static Future<SharedPreferenceHelper> getInstance() async {
  //   if (_instance == null) {
  //     _instance = SharedPreferenceHelper._internal();
  //     _instance!._preferences = await SharedPreferences.getInstance();
  //   }
  //   return _instance!;
  // }
  static late SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  // Set data method
  static Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      instance.setString(key, value);
    } else if (value is int) {
      instance.setInt(key, value);
    } else if (value is double) {
      instance.setDouble(key, value);
    } else if (value is bool) {
      instance.setBool(key, value);
    } else if (value is List<String>) {
      instance.setStringList(key, value);
    } else {
      throw Exception('Unsupported Type');
    }
  }

  // Get data method
  static dynamic getData(String key) {
    return instance.get(key);
  }
}
