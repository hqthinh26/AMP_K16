import 'package:dio/dio.dart';

class Course {
  late Dio _dio;
  late String id;
  late int limit;
  late int page;

  Course() {
    BaseOptions baseOptions = BaseOptions(
        contentType: 'application/json',
        baseUrl: 'https://api.letstudy.org',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        receiveDataWhenStatusError: true);
    this._dio = Dio(baseOptions);
  }

  Future<List<dynamic>> topSell({page, limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this._dio.post("/course/top-sell", data: {
        "limit": this.limit,
        "page": this.page,
      });
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];

      return payload;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.message);
        throw 'alo';
      } else {
        print(e.message);
        throw 'alo2';
      }
    }
  }
}
