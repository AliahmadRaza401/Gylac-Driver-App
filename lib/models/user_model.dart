class UserModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;

  UserModel(
      {required this.uid,
      required this.fullname,
      required this.email,
      required this.profilepic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullName"];
    email = map["email"];
    profilepic = map["image"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullName": fullname,
      "email": email,
      "image": profilepic,
    };
  }
}
