//import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioCustomClass {
  String route;
  late Dio _dio;

  DioCustomClass({required this.route}) {
    BaseOptions baseOption = BaseOptions(
      baseUrl: 'https://api.letstudy.org${this.route}',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
    );
    this._dio = Dio(baseOption);
    this.addInterceptors();
  }

  void addInterceptors() {
    this._dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) async {
            return await this.requestInterceptor(options, handler);
          },
          onResponse: (response, handler) async {
            return await this.responseInterceptor(response, handler);
          },
          onError: (error, handler) => this.errorInterceptor(error, handler),
        ));
  }

  Future<dynamic> requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

      print("API này cần token: ${prefs.getString("token")}");
      if (prefs.containsKey("token")) {
        String? token = prefs.getString("token");
        options.headers['Authorization'] = "Bearer $token";
      } else {
        return DioError(
            requestOptions: options,
            type: DioErrorType.other,
            error: "Yêu cầu người dùng đăng nhập");
      }
    }
    return handler.next(options);
  }

  Future<dynamic> responseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    print("status code: ${response.statusCode}");
    handler.next(response);
  }

  dynamic errorInterceptor(DioError error, ErrorInterceptorHandler handler) {
    print("error Interceptor: ${error.error}");
    handler.next(error);
  }

  //Creating this._dio getter
  Dio get dioGetterSetter {
    return this._dio;
  }
}
