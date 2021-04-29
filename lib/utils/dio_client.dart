import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  static Dio _instance;

  static Future<Dio> getInstance() async {
    if (_instance != null) {
      return _instance;
    }

    _instance = Dio();

    _instance.options.headers
        .addAll({Headers.acceptHeader: "application/json"});

    _instance.options.connectTimeout = 5000;
    _instance.options.receiveTimeout = 5000;
    _instance.options.sendTimeout = 5000;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String cookiePath = appDocPath + "/.cookies/";

    var cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
    var cookieManager = CookieManager(cookieJar);

    _instance.interceptors.add(cookieManager);

    return _instance;
  }
}
