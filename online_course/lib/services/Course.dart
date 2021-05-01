import 'package:dio/dio.dart';
import './DioCustomClass.dart';
import '../containers/CourseContainer.dart';

class Course extends DioCustomClass {
  late String id;
  late int limit;
  late int page;

  Course() : super(route: "/course");

  //Danh sách khoá học bán chạy nhất
  Future<Iterable<CourseContainer>> topSell(
      {required page, required limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this
          .dioGetterSetter
          .post("/top-sell", data: {"limit": this.limit, "page": this.page});
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];

      if (payload.length > 0) {
        return payload.map((item) => CourseContainer(item));
      } else {
        return <CourseContainer>[];
      }
    } on DioError catch (e) {
      return throw e;
    }
  }

  //Danh sách khoá học mới nhất
  Future<Iterable<CourseContainer>> topNew(
      {required page, required limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this
          .dioGetterSetter
          .post("/top-new", data: {"page": this.page, "limit": this.limit});
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];

      if (payload.length > 0) {
        return payload.map((item) => CourseContainer(item));
      } else {
        return <CourseContainer>[];
      }

      // return payload.isEmpty
      //     ?
      //     : payload.map((item) => CourseContainer(item));
    } on DioError catch (e) {
      return throw e;
    }
  }

  //Danh sách khóa học đánh giá cao nhất
  Future<Iterable<CourseContainer>> topRate(
      {required page, required limit}) async {
    try {
      this.page = page;
      this.limit = limit;

      Response response = await this
          .dioGetterSetter
          .post("/top-rate", data: {"page": this.page, "limit": this.limit});
      Map<String, dynamic> data = response.data;
      List<dynamic> payload = data["payload"];
      if (payload.length > 0) {
        return payload.map((item) => CourseContainer(item));
      } else {
        return <CourseContainer>[];
      }
    } on DioError catch (e) {
      return throw e;
    }
  }
}
