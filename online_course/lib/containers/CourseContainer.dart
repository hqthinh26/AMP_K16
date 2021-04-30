class CourseContainer {
  late String id;
  late String title;
  late String subtitle;
  late int price;
  late String description;
  late List<String> requirement;

  late List<String> learnWhat;
  late int soldNumber;
  late int ratedNumber;
  late int videoNumber;
  late dynamic totalHours;
  late dynamic fomalityPoint;
  late dynamic contentPoint;
  late dynamic presentationPoint;
  late String imageUrl;
  late String promoVidUrl;
  late String status; //Either: "PENDING" or "COMPLETE"

  late bool isDeleted;
  late bool isHidden;
  late String createdAt;
  late String updatedAt;
  late String instructorId;
  late int typeUploadVideoLesson; //1: "Upload File", 2: "Link Youtube"
  late List<String> categoryIds;

  CourseContainer(Map<String, dynamic> courseObject) {
    this.id = courseObject["id"] ?? "testing";

    this.title = courseObject["title"] ?? "Testing title";

    this.subtitle = courseObject["subtitle"] ?? "Testing subtitle";

    this.price = courseObject["price"] ?? 100;

    this.description = courseObject["description"] ?? "Testing Description";

    this.requirement = courseObject["requirement"] ??
        <String>["requirment_1", "requirement_2"];

    this.learnWhat = courseObject["learnWhat"] ??
        <String>["Coffee", "Green Tea", "Fried Chicken Nugget"];

    this.soldNumber = courseObject["soldNumber"] ?? 111;

    this.ratedNumber = courseObject["ratedNumber"] ?? 3;

    this.videoNumber = courseObject["videoNumber"] ?? -100;

    this.totalHours = courseObject["totalHours"] ?? -100;

    this.fomalityPoint = courseObject["fomalityPoint"] ?? -100;

    this.contentPoint = courseObject["contentPoint"] ?? -100;

    this.presentationPoint = courseObject["presentationPoint"] ?? -100;

    this.imageUrl = courseObject["imageUrl"] ??
        "https://static.scientificamerican.com/sciam/cache/file/92E141F8-36E4-4331-BB2EE42AC8674DD3_source.jpg";

    this.promoVidUrl = courseObject["promoVidUrl"] ??
        "https://www.youtube.com/watch?v=ByH9LuSILxU";

    this.status = courseObject["status"] ?? "UNRESOLVED";

    this.isDeleted = courseObject["isDeleted"] ?? false;

    this.isHidden = courseObject["isHidden"] ?? false;

    this.createdAt = courseObject["title"] ?? "2021-05-01";

    this.updatedAt = courseObject["updatedAt"] ?? "2030-01-01";

    this.instructorId =
        courseObject["instructorId"] ?? "92bfd9f0-9425-4d6e-912d-2387218fe330";

    this.typeUploadVideoLesson = courseObject["typeUploadVideoLesson"] ?? 1;

    this.categoryIds = courseObject["categoryIds"] ?? <String>[];
  }
}
