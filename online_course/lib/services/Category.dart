import 'package:dio/dio.dart';
//import 'package:flutter/material.dart';
//import 'dart:convert' as convert;

class Category {
  late Dio _dio;

  Category() {
    BaseOptions baseOption = BaseOptions(
        contentType: 'application/json',
        baseUrl: 'https://api.letstudy.org',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        receiveDataWhenStatusError: true);

    this._dio = Dio(baseOption);
  }

  Future<List<dynamic>> getAllCategories() async {
    try {
      Response response = await this._dio.get("/category/all");
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
