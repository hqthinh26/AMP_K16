import 'package:shared_preferences/shared_preferences.dart';

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

  Future<Iterable<dynamic>> getProcessCourses() async {
    try {
      Response response = await this.dioGetterSetter.get("/get-process-courses",
          options: Options(headers: <String, dynamic>{"requiresToken": true}));
      Map<String, dynamic> result = response.data;
      Iterable<dynamic> payload = result["payload"];
      return payload.length != 0 ? payload : <dynamic>[];
    } on DioError catch (e) {
      throw (e);
    }
  }

  Future<Iterable<dynamic>> getFavoriteCourses() async {
    try {
      Response response = await this.dioGetterSetter.get(
          "/get-favorite-courses",
          options: Options(headers: <String, dynamic>{"requiresToken": true}));
      Map<String, dynamic> result = response.data;
      Iterable<dynamic> payload = result["payload"];
      return payload.length != 0 ? payload : <dynamic>[];
    } on DioError catch (e) {
      throw (e);
    }
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    try {
      Response user = await this
          .dioGetterSetter
          .get("/me", options: Options(headers: {"requiresToken": true}));
      Map<String, dynamic> data = user.data;
      Map<String, dynamic> payload = data["payload"];
      print(payload);
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

      response = await this.dioGetterSetter.post('/login', data: body);

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

  Future<bool> updateUserProfile(
      {required String name,
      required String avatar,
      required String phone}) async {
    try {
      Map<String, dynamic> data = {
        "name": name,
        "avatar": avatar,
        "phone": phone
      };
      Response response = await this.dioGetterSetter.put("/update-profile",
          data: data, options: Options(headers: {"requiresToken": true}));

      print(response.data);
      return response.statusCode == 200 ? true : false;
    } on DioError catch (e) {
      throw (e);
    }
  }
}
