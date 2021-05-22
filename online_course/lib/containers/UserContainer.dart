class UserContainer {
  late String id;
  late String email;
  String avatar = "https://storage.googleapis.com/letstudy/Avatar/28028b44-8f3b-4973-8b0d-b069f15f2b33.jpeg";
  late String name;
  late List<dynamic> favoriteCategories;
  late int point;
  late String phone;
  late String type;
  late String facebookId;
  late String googleId;
  late bool isDeleted;
  late bool isActivated;

  UserContainer(Map<String, dynamic> user) {
    this.id = user["id"] ?? "";
    this.email = user["email"] ?? "";
    this.avatar = user["avatar"] ?? "https://storage.googleapis.com/letstudy/Avatar/28028b44-8f3b-4973-8b0d-b069f15f2b33.jpeg";
    this.name = user["name"] ?? "Empty";
    
    this.favoriteCategories = user["favoriteCategories"] == null
        ? <dynamic>[
            "JavaScript",
            "Python",
            "React",
          ]
        : user["favoriteCategories"].isEmpty
            ? <dynamic>[
                "JavaScript",
                "Python",
                "React",
              ]
            : user["favoriteCategories"];
    this.point = user["point"] ?? 0;
    this.phone = user["phone"] ?? "096 789 7422";
    this.type = user["type"] ?? "";
    this.facebookId = user["facebookId"] ?? "";
    this.isDeleted = user["isDeleted"] ?? false;
    this.isActivated = user["isActivated"] ?? true;
  }
}
