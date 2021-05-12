import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.getString(key) ?? false;
    return value;
  }

  save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    return await prefs.setString(key, token);
  }
}
