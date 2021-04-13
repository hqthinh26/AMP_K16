// import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:online_course/services/DioCustomClass.dart';
import 'package:flutter/material.dart';

class User {
  String email;
  String password;
  late String username;
  late String phone;
  late DioCustomClass _dio;

  User.register({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  }) {
    this._dio = DioCustomClass(route: "/user");
  }

  User.login({required this.email, required this.password}) {
    this._dio = DioCustomClass(route: "/user");
  }

  void _showMaterialDialog(context, errorMessage) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Thông báo"),
              content: new Text(errorMessage),
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
      Dio dioSetter = this._dio.dioGetterSetter;
      var response = await dioSetter.post("/user/register", data: body);
      if (response.statusCode == 200) {
        print('successful response: $response');
      } else {
        print('failed response:  $response');
      }
    } on DioError catch (e) {
      this._showMaterialDialog(context, e.response?.data["message"]);
    }
  }

  Future<void> login(BuildContext context) async {
    try {
      Response response;
      Map<String, dynamic> body = {
        'email': this.email,
        'password': this.password,
      };

      Dio dioSetter = this._dio.dioGetterSetter;

      response = await dioSetter.post('https://api.letstudy.org/user/login',
          data: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        String token = data["token"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);

        String tokenX = prefs.getString("token") ?? "";
        print('token is $tokenX');
      }
    } on DioError catch (e) {
      String errorMessage = e.response?.data["message"] ?? "Giá trị rác";
      this._showMaterialDialog(context, errorMessage);
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.message);
      } else {
        print(e.message);
      }
    }
  }
}
