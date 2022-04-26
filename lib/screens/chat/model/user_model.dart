class ChatDriverModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;

  ChatDriverModel(
      {required this.uid,
      required this.fullname,
      required this.email,
      required this.profilepic});

  ChatDriverModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullname"];
    email = map["email"];
    profilepic = map["profilepic"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "email": email,
      "profilepic": profilepic,
    };
  }
}
