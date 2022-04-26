import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/models/driver_model.dart';
import 'package:driver_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class UserProvider extends ChangeNotifier {
  late BuildContext context;
  bool loading = false;

  init({required BuildContext context}) {
    this.context = context;
  }

  DriverModel? driverModel;
  UserModel? userModel;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future getDriverDataByID(String uid) async {
    try {
      setLoading(true);
      await FirebaseFirestore.instance
          .collection('drivers')
          .where('id', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  print(doc.data());
                  driverModel =
                      DriverModel.fromMap(doc.data() as Map<String, dynamic>);
                  setLoading(false);
                }),
              });
    } catch (e) {
      print(e.toString());
      setLoading(false);
      return null;
    }
  }

  Future getUserDataByID(String uid) async {
    log('uid: $uid');
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  print("User Col ${doc.data()}");
                  userModel =
                      UserModel.fromMap(doc.data() as Map<String, dynamic>);
                }),
              });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
