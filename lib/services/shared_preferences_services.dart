import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const KEY_USER_DATA = 'KEY_USER_DATA';

  Future<void> saveStringData(String data, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  Future<String> getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<void> resetStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
