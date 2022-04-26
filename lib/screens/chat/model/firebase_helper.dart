import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/models/driver_model.dart';
import 'package:driver_app/models/user_model.dart';

class FirebaseHelper {
  static Future<DriverModel?> getDriverModelById(String uid) async {
    print('uid: $uid');
    DriverModel? driverModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("drivers").doc(uid).get();

    if (docSnap.data() != null) {
      driverModel = DriverModel.fromMap(docSnap.data() as Map<String, dynamic>);
      print('DriverModel: $DriverModel');
    } else {
      print("users null");
    }

    return driverModel;
  }

  static Future<UserModel?> getUserModelById(String uid) async {
    print('uid: $uid');
    UserModel? userModel;

    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (docSnap.data() != null) {
      userModel = UserModel.fromMap(docSnap.data() as Map<String, dynamic>);
      print('UserModel: $UserModel');
    } else {
      print("users null");
    }

    return userModel;
  }
}
