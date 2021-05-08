class UserContainer {
  late String id;
  late String email;
  late String avatar;
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
    this.avatar = user["avatar"] ?? "";
    this.name = user[""] ?? "huynh quoc thinh";
    print('user: $user');
    this.favoriteCategories = user["favoriteCategories"].isNotEmpty
        ? user["favoriteCategories"]
        : <dynamic>[
            "JavaScript",
            "Python",
            "React",
          ];
    //this.favoriteCategories = [];
    this.point = user["point"] ?? 0;
    this.phone = user["phone"] ?? "096 789 7422";
    this.type = user["type"] ?? "";
    this.facebookId = user["facebookId"] ?? "";
    this.isDeleted = user["isDeleted"] ?? false;
    this.isActivated = user["isActivated"] ?? true;
  }
}
