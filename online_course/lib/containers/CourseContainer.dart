class CourseContainer {
  late String id;
  late String title;
  late String subtitle;
  late int price;
  late String description;
  late List<dynamic> requirement;

  late List<dynamic> learnWhat;
  late double star;
  late int soldNumber;
  late int ratedNumber;
  late int videoNumber;
  late dynamic totalHours;
  dynamic formalityPoint = 0;
  dynamic contentPoint = 0;
  dynamic presentationPoint = 0;
  late String imageUrl;
  late String promoVidUrl;
  late String status; //Either: "PENDING" or "COMPLETE"

  late bool isDeleted;
  late bool isHidden;
  late String createdAt;
  late String updatedAt;
  late String instructorId;
  late int typeUploadVideoLesson; //1: "Upload File", 2: "Link Youtube"
  late List<dynamic> categoryIds;
  late String instructorUserId;
  late String instructorUserName;
  bool isLoading = true;

  @override
  String toString() {
    return "${this.title} - ${this.instructorId} - ${this.instructorUserName}";
  }

  CourseContainer(Map<String, dynamic> courseObject) {
    this.id = courseObject["id"] ?? "Testing";

    this.isLoading = courseObject["id"] is String  ? false : true;

    this.title = courseObject["title"] ?? "Testing title";

    this.subtitle = courseObject["subtitle"] ?? "Testing subtitle";

    this.price = courseObject["price"] ?? 100;

    this.description = courseObject["description"] ?? "Testing Description";

    this.requirement = courseObject["requirement"] ??
        <dynamic>["requirment_1", "requirement_2"];

    this.learnWhat = courseObject["learnWhat"] ??
        <dynamic>["Coffee", "Green Tea", "Fried Chicken Nugget"];

    this.soldNumber = courseObject["soldNumber"] ?? 111;

    this.ratedNumber = courseObject["ratedNumber"] ?? 3;

    this.videoNumber = courseObject["videoNumber"] ?? -100;

    this.totalHours = courseObject["totalHours"] ?? -100;

    this.formalityPoint = courseObject["formalityPoint"] ?? 0;

    this.contentPoint = courseObject["contentPoint"] ?? 0;

    this.presentationPoint = courseObject["presentationPoint"] ?? 0;

    this.star =
        (this.formalityPoint + this.contentPoint + this.presentationPoint) /
            3.toDouble();
    this.imageUrl = courseObject["imageUrl"] ??
        "https://static.scientificamerican.com/sciam/cache/file/92E141F8-36E4-4331-BB2EE42AC8674DD3_source.jpg";

    this.promoVidUrl = courseObject["promoVidUrl"] ??
        "https://www.youtube.com/watch?v=ByH9LuSILxU";

    this.status = courseObject["status"] ?? "UNRESOLVED";

    this.isDeleted = courseObject["isDeleted"] ?? false;

    this.isHidden = courseObject["isHidden"] ?? false;

    this.createdAt = courseObject["createdAt"] ?? "2021-05-01";

    this.updatedAt = courseObject["updatedAt"] ?? "2030-01-01";

    this.instructorId =
        courseObject["instructorId"] ?? "92bfd9f0-9425-4d6e-912d-2387218fe330";

    this.typeUploadVideoLesson = courseObject["typeUploadVideoLesson"] ?? 1;

    this.categoryIds = courseObject["categoryIds"] ?? <dynamic>[];

    this.instructorUserId = courseObject["instructor.user.id"] ?? "";

    this.instructorUserName =
        courseObject["instructor.user.name"] ?? courseObject["name"] ?? "";
  }
}
