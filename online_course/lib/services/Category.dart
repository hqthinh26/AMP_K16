import 'package:dio/dio.dart';
//import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class Category {
  late Dio _dio;
  late int category_id;

  Category() {
    BaseOptions baseOption = BaseOptions(
        contentType: 'application/json',
        baseUrl: 'https://api.letstudy.org',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        receiveDataWhenStatusError: true);

    this._dio = Dio(baseOption);
  }

  Future<dynamic> getAllCategories() async {
    try {
      Response response = await this._dio.get("/category/all");
      Map<String, dynamic> data = convert.jsonDecode(response.data);
      print('this is data: $data');
      return 1;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.message);
        return 0;
      } else {
        print(e.message);
        return 0;
      }
    }
  }
}
