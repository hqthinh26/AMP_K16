import 'package:dio/dio.dart';
import './DioCustomClass.dart';
import '../containers/CourseContainer.dart';

class Course extends DioCustomClass {
  late String id;
  late int limit;
  late int page;
  late String keyword;
  late int offset;

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

  Future<Iterable<CourseContainer>> searchedCourses(
      {String keyword = "",
      int limit = 10,
      int offset = 0,
      String? category}) async {
    try {
      this.keyword = keyword;
      this.limit = limit;
      this.offset = offset;

      Map<String, dynamic> data = {
        "keyword": this.keyword,
        "opt": {
          "sort": {
            "attribute": "price",
            "rule": "ASC",
          },
          "category": [],
        },
        "limit": this.limit,
        "offset": this.offset,
      };
      Response response =
          await this.dioGetterSetter.post("/search", data: data);
      Map<String, dynamic> result = response.data;
      List<dynamic> rows = result["payload"]["rows"];
      if (rows.length > 0) {
        return rows.map((item) => CourseContainer(item));
      } else {
        return <CourseContainer>[];
      }
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<CourseContainer> getCourseInfo(String courseId) async {
    try {
      this.id = courseId;

      // Map<String, dynamic> queryParameters = {"id": this.id};
      Response response = await this
          .dioGetterSetter
          .get("/get-course-info", queryParameters: {"id": this.id});
      Map<String, dynamic> result = response.data;
      Map<String, dynamic> payload = result["payload"];
      print("detail: $payload");
      return CourseContainer(payload);
    } on DioError catch (e) {
      throw e;
    }
  }

  //Danh sách khoá học the keyword
}
