import 'package:flutter/foundation.dart';

class AppConfig {
  final String baseUrl;
  final String apiUrl;

  AppConfig({
    @required this.baseUrl,
    @required this.apiUrl,
  });

  static AppConfig _instance;

  static AppConfig getInstance({baseUrl, apiUrl}) {
    if (_instance == null) {
      _instance = AppConfig(
        baseUrl: baseUrl,
        apiUrl: apiUrl,
      );
    }

    return _instance;
  }

  String parseFullPath(String url) {
    if (url.startsWith('http')) {
      return url;
    }
    if (url.startsWith('/')) {
      return baseUrl + url.substring(1);
    }
    return baseUrl + url;
  }
}
