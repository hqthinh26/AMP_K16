// import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:online_course/services/DioCustomClass.dart';
import 'package:flutter/material.dart';

class User extends DioCustomClass {
  String email = "";
  String password = "";
  late String username;
  late String phone;

  User() : super(route: "/user");

  User.register({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  }) : super(route: "/user");

  User.login({required this.email, required this.password})
      : super(route: "/user");

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

  Future<Map<String, dynamic>> getUserInfo() async {
    try {
      Response user = await this.dioGetterSetter.get("/me");
      Map<String, dynamic> data = user.data;
      Map<String, dynamic> payload = data["payload"];
      return payload;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.message);
      } else {
        print(e.message);
      }
      return {"message": "Lấy thông tin người dùng thất bại"};
    }
  }

  Future<void> register(BuildContext context) async {
    try {
      Map<String, String> body = {
        "username": this.username,
        "email": this.email,
        "phone": this.phone,
        "password": this.password
      };

      Response response =
          await this.dioGetterSetter.post("/register", data: body);
      if (response.statusCode == 200) {
        print("successful response: $response");
      } else {
        print("failed response:  $response");
      }
    } on DioError catch (e) {
      print(e.response?.data);
      this._showMaterialDialog(
          context,
          e.response?.data["message"] == null
              ? 'Lỗi bất thường'
              : e.response?.data["message"]);
    }
  }

  Future<bool> login(BuildContext context) async {
    try {
      Response response;
      Map<String, dynamic> body = {
        'email': this.email,
        'password': this.password,
      };

      response = await this
          .dioGetterSetter
          .post('https://api.letstudy.org/user/login', data: body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        String token = data["token"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);

        return true;
      }
      return false;
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
      return false;
    }
  }
}
