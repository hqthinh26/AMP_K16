import 'package:dio/dio.dart';
import 'package:online_course/services/DioCustomClass.dart';
//import 'package:flutter/material.dart';
//import 'dart:convert' as convert;

class Category extends DioCustomClass {
  Category() : super(route: "/category");

  Future<List<dynamic>> getAllCategories() async {
    try {
      Response response = await this.dioGetterSetter.get("/all");
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];

      return payload;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.message);
        throw "fail at get All Category";
      } else {
        print(e.message);
        throw "fail at get All Category";
      }
    }
  }
}
