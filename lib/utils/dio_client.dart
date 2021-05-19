import 'package:dio/dio.dart';

class DioClient {
  static Dio _instance;

  static Future<Dio> getInstance() async {
    if (_instance != null) {
      return _instance;
    }

    _instance = Dio();

    return _instance;
  }
}
