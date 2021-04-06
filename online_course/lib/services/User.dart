import 'dart:convert' as convert;
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String phone;
  String password;
  Dio _dio;

  User.register({this.username, this.email, this.phone, this.password}) {
    BaseOptions baseOption = BaseOptions(
      baseUrl: 'https://api.letstudy.org',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      receiveDataWhenStatusError: true,
    );
    this._dio = Dio(baseOption);
  }

  User.login({this.username, this.password}) {
    BaseOptions baseOption = BaseOptions(
      baseUrl: 'https://api.letstudy.org',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
    );
    this._dio = Dio(baseOption);
  }

  void _showMaterialDialog(context, errorMessage) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Thông báo"),
              content: new Text('${errorMessage['message']}'),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  Future<void> register(BuildContext context) async {
    try {
      Map<String, String> body = {
        'username': this.username,
        'email': this.email,
        'phone': this.phone,
        'password': this.password
      };
      //var url = Uri.parse('https://api.letstudy.org/user/register');
      var response = await this._dio.post("/user/register", data: body);
      if (response.statusCode == 200) {
        print('successful response: $response');
      } else {
        print('failed response:  $response');
      }
    } on DioError catch (e) {
      print('alo ${e.response.statusCode}');
      print('alo2 ${e.response.data}');
      this._showMaterialDialog(context, e.response.data);
    }
  }

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
