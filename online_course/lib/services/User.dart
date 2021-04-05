import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String phone;
  String password;

  User.register({this.username, this.email, this.phone, this.password});
  User.login({this.username, this.password});

  Future<int> register() async {
    Map<String, String> body = {
      'username': this.username,
      'email': this.email,
      'phone': this.phone,
      'password': this.password
    };
    var url = Uri.parse('https://api.letstudy.org/user/register');
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      return 200;
    } else {
      print(
          'failed at endpoint: /catagory/all- status code: ${response.statusCode}');
      return response.statusCode;
    }
  }

  Future<int> login() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      // 'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      //  'Authorization': '<Your token>'
    };

    // Map<String, String> bodyX = {
    //   'username': this.username,
    //   'password': this.password
    // };

    var url = Uri.parse('https://api.letstudy.org/user/login');
    var response = await http.post(url,
        body: convert.jsonEncode(
            {'username': '${this.username}', 'password': '${this.password}'}),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      var body = convert.jsonDecode(response.body);
      print(body);
      return 200;
    } else {
      print('failed at /user/login');
      return response.statusCode;
    }
  }
}
