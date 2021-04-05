import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String phone;
  String password;
  Dio _dio;

  User.register({this.username, this.email, this.phone, this.password});
  User.login({this.username, this.password}) {
    BaseOptions baseOption = BaseOptions(
      //baseUrl: 'https://api.letstudy.org',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: Headers.formUrlEncodedContentType,
      receiveDataWhenStatusError: true,
    );
    this._dio = Dio(baseOption);
  }

  // Future<int> register() async {
  //   Map<String, String> body = {
  //     'username': this.username,
  //     'email': this.email,
  //     'phone': this.phone,
  //     'password': this.password
  //   };
  //   var url = Uri.parse('https://api.letstudy.org/user/register');
  //   var response = await http.post(url, body: body);
  //   if (response.statusCode == 200) {
  //     return 200;
  //   } else {
  //     print(
  //         'failed at endpoint: /catagory/all- status code: ${response.statusCode}');
  //     return response.statusCode;
  //   }
  // }

  Future<void> login() async {
    try {
      Response response;
      Map<String, dynamic> body = {
        'username': this.username,
        'password': this.password,
      };
      response = await this
          ._dio
          .post('https://api.letstudy.org/user/login', data: body);

      if (response.statusCode == 200) {
        print(response);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.message);
      } else {
        print(e.message);
      }
    }
  }
}
