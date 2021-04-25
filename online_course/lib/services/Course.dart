import 'package:dio/dio.dart';
import './DioCustomClass.dart';

class Course extends DioCustomClass {
  late String id;
  late int limit;
  late int page;

  Course() : super(route: "/course");

  Future<List<dynamic>> topSell({page, limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this.dioGetterSetter.post("/top-sell", data: {
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

      Response response = await this.dioGetterSetter.post("/top-rate", data: {
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
