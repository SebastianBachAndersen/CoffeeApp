import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  static Dio _instance;

  static Future<Dio> getInstance() async {
    if (_instance != null) {
      return _instance;
    }
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.getString(key) ?? "";

    _instance = Dio();

    _instance.options.headers["authorization"] = "Bearer $value";

    return _instance;
  }
}
