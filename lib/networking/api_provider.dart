import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:the_coffe_collection/utils/dio_client.dart';

import '../app_config.dart';

class ApiProvider {
  final String _baseUrl = AppConfig.getInstance().apiUrl;

  Future<dynamic> get(String url,
      [Map<String, dynamic> queryParams = const {}]) async {
    Dio _httpClient = await DioClient.getInstance();

    String fullUrl;
    if (url.startsWith('http')) {
      fullUrl = url;
    } else {
      fullUrl = _baseUrl + url;
    }

    final response = await _httpClient.get(fullUrl,
        queryParameters: queryParams,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }));

    return response.data;
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic> jsonBody = const {}, bool formData = false}) async {
    Dio _httpClient = await DioClient.getInstance();

    String fullUrl;
    if (url.startsWith('http')) {
      fullUrl = url;
    } else {
      fullUrl = _baseUrl + url;
    }

    dynamic body;

    if (formData) {
      body = FormData.fromMap(jsonBody);
    } else {
      body = jsonBody;
    }

    final response = await _httpClient.post(fullUrl, data: body,
        options: Options(validateStatus: (status) {
      return status < 500;
    }));

    return response.data;
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic> jsonBody = const {}, bool formData = false}) async {
    Dio _httpClient = await DioClient.getInstance();

    String fullUrl;
    if (url.startsWith('http')) {
      fullUrl = url;
    } else {
      fullUrl = _baseUrl + url;
    }

    String encodedBody = json.encode(jsonBody);

    dynamic body;

    if (formData) {
      body = FormData.fromMap(jsonBody);
    } else {
      body = encodedBody;
    }

    final response = await _httpClient.put(fullUrl, data: body,
        options: Options(validateStatus: (status) {
      return status < 500;
    }));

    return response.data;
  }

  Future<dynamic> delete(String url) async {
    Dio _httpClient = await DioClient.getInstance();

    String fullUrl;
    if (url.startsWith('http')) {
      fullUrl = url;
    } else {
      fullUrl = _baseUrl + url;
    }

    final response = await _httpClient.delete(fullUrl,
        options: Options(validateStatus: (status) {
      return status < 500;
    }));

    return response.data;
  }
}
