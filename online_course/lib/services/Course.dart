import 'package:dio/dio.dart';

class Course {
  late Dio _dio;
  late String id;
  late int limit;
  late int page;

  Course() {
    BaseOptions baseOptions = BaseOptions(
        contentType: 'application/json',
        baseUrl: 'https://api.letstudy.org/course',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        receiveDataWhenStatusError: true);
    this._dio = Dio(baseOptions);
  }

  Future<List<dynamic>> topSell({page, limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this._dio.post("/top-sell", data: {
        "limit": this.limit,
        "page": this.page,
      });
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];

      return payload;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<dynamic>> topRate({page, limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this._dio.post("/top-rate", data: {
        "page": this.page,
        "limit": this.limit,
      });
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];

      return payload;
    } on DioError catch (e) {
      throw e;
    }
  }
}
