class User {
  String id = "";
  String email = "";
  String avatar = "";
  String name = "Người dùng có tên là <null>";
  User({Map<String, dynamic> user = const <String, dynamic>{}}) {
    this.id = user["id"] ?? this.id;
    this.email = user["email"] ?? this.email;
    this.avatar = user["avatar"] ?? this.avatar;
    this.name = user["name"] ?? this.name;
  }
}

class Comment {
  String id = "";
  String userId = "";
  String courseId = "";
  dynamic formalityPoint = 0;
  dynamic contentPoint = 0;
  dynamic presentationPoint = 0;
  String content = "";
  String createdAt = "now()";
  String updatedAt = "now()";
  dynamic averagePoint = 0;
  User user = User();

  Comment({Map<String, dynamic> comment = const <String, dynamic>{}}) {
    this.id = comment["id"] ?? this.id;
    this.userId = comment["userId"] ?? this.userId;
    this.courseId = comment["courseId"] ?? this.courseId;
    this.formalityPoint = comment["formalityPoint"] ?? this.formalityPoint;
    this.contentPoint = comment["contentPoint"] ?? this.contentPoint;
    this.presentationPoint =
        comment["presentationPoint"] ?? this.presentationPoint;
    this.content = comment["content"] ?? "Không có comment nào cả";
    this.createdAt = comment["createdAt"] ?? this.createdAt;
    this.updatedAt = comment["updatedAt"] ?? this.updatedAt;
    this.averagePoint = comment["averagePoint"] ?? this.averagePoint;
    this.user = User(user: comment["user"] ?? {});
  }
}

class Ratings {
  Iterable<Comment> ratingList = <Comment>[];
  List<dynamic> stars = <dynamic>[];

  Ratings({Map<String, dynamic> ratings = const <String, dynamic>{}}) {
    List<dynamic> ratingList = ratings["ratingList"] ?? <dynamic>[];
    this.ratingList = ratingList.length != 0
        ? ratingList.map((item) => Comment(comment: item))
        : this.ratingList;

    this.stars = ratings["stars"] ?? <dynamic>[];
  }
}
