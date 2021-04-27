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
    ));
  }

  Future<dynamic> requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";

    options.headers['Authorization'] = "Bearer $token";
    print('token $token');

    return handler.next(options);
  }

  //Creating this._dio getter
  Dio get dioGetterSetter {
    return this._dio;
  }
}
