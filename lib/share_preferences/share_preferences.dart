import 'package:shared_preferences/shared_preferences.dart';

class SharePreferences {
  static late SharedPreferences _preferences;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get name => _preferences.getString('_name') ?? _name;
  static set name(String name) {
    _name = name;
    _preferences.setString('_name', name);
  }

  static bool get isDarkMode =>
      (_preferences.getBool('_isDarkMode') ?? _isDarkMode);
  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    _preferences.setBool('_isDarkMode', isDarkMode);
  }

  static int get gender => _preferences.getInt('_gender') ?? _gender;
  static set gender(int gender) {
    _gender = gender;
    _preferences.setInt('_gender', gender);
  }
}
