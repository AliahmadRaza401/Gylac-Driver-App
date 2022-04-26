// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/providers/auth_provider.dart';
import 'package:driver_app/screens/driver_vehicle_detail.dart';
import 'package:driver_app/screens/home_screen.dart';
import 'package:driver_app/screens/login.dart';
import 'package:driver_app/sevices/shared_pref_services.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:driver_app/utils/motion_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/driver_model.dart';
import 'firebase_services.dart';

class AuthServices {
  static var errorMessage;

  //SignIn
  static signIn(BuildContext context, String email, String password) async {
    final auth = FirebaseAuth.instance;
    AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    _authProvider.isLoading(true);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                AppRoutes.replace(
                  context,
                  DriverHomeScreen(),
                ),
                MyMotionToast.success(
                  context,
                  "Welcome".tr,
                  'LogIn Success'.tr,
                ),
                SharedPrefServices.userLoggedIn(true),
                _authProvider.isLoading(false),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid.".tr;
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.".tr;
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.".tr;
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.".tr;
          break;
        case "too-many-requests":
          errorMessage = "Too many requests".tr;
          break;
        case "operation-not-allowed":
          errorMessage =
              "Signing in with Email and Password is not enabled.".tr;
          break;
        default:
          errorMessage = "An undefined Error happened.".tr;
      }
      _authProvider.isLoading(false);

      // // GeneralDialogs.showOopsDialog(context, errorMessage);
      MyMotionToast.error(
        context,
        "UnAuthorized".tr,
        errorMessage,
      );
      return "false";
    }
  }

  // SignUp-----------------------------------------
  static Future signUp(
      BuildContext context,
      String fullName,
      String email,
      password,
      mobileNumber,
      dp,
      vDp,
      vehicleCompany,
      vehicleNumber,
      vehicleRegNumber,
      vehicleDesign,
      vehicleChassisNumber) async {
    final _auth = FirebaseAuth.instance;
    AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    _authProvider.isLoading(true);
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                print("User Created_______________________"),
                postDetailsToFirestore(
                  context,
                  fullName,
                  email,
                  password,
                  mobileNumber,
                  dp,
                  vDp,
                  vehicleCompany,
                  vehicleNumber,
                  vehicleRegNumber,
                  vehicleDesign,
                  vehicleChassisNumber,
                ),
              })
          .catchError((e) {
        print('e: $e');
        MyMotionToast.error(
          context,
          "Error",
          e!.message,
        );

        _authProvider.isLoading(false);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid".tr;
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.".tr;
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.".tr;
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.".tr;
          break;
        case "too-many-requests":
          errorMessage = "Too many requests".tr;
          break;
        case "operation-not-allowed":
          errorMessage =
              "Signing in with Email and Password is not enabled.".tr;
          break;
        default:
          errorMessage = "An undefined Error happened.".tr;
      }

      _authProvider.isLoading(false);
      MyMotionToast.error(
        context,
        "Oops!".tr,
        errorMessage,
      );
    }
  }

  static postDetailsToFirestore(
      BuildContext context,
      fullName,
      email,
      password,
      mobileNumber,
      dp,
      vDp,
      vehicleCompany,
      vehicleNumber,
      vehicleRegNumber,
      vehicleDesign,
      vehicleChassisNumber) async {
    final _auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    var userImage =
        await FirebaseServices.imageUpload(dp, email.toString(), context);
    var vehicleImage =
        await FirebaseServices.imageUpload(vDp, email.toString(), context);
    DriverModel driverModel = DriverModel(
      fullName: fullName,
      email: email,
      password: password,
      mobileNumber: mobileNumber,
      dp: userImage.toString(),
      vDp: vehicleImage.toString(),
      vehicleCompany: vehicleCompany,
      vehicleNumber: vehicleNumber,
      vehicleRegNumber: vehicleRegNumber,
      vehicleDesign: vehicleDesign,
      vehicleChassisNumber: vehicleChassisNumber,
      orderCount: 0,
      status: 'pending',
      wallet: 0,
      level: 0,
    );

    await firebaseFirestore.collection("drivers").doc(user!.uid).set({
      'id': user.uid,
      'fullName': fullName,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'dp': userImage.toString(),
      'vDp': vehicleImage.toString(),
      'vehicleCompany': vehicleCompany,
      'vehicleNumber': vehicleNumber,
      'vehicleRegNumber': vehicleRegNumber,
      'vehicleDesign': vehicleDesign,
      'vehicleChassisNumber': vehicleChassisNumber,
      'rating': 5.0,
      'level': 0,
      'wallet': 0,
      'orderCount': 0,
      'status': "pending",
      'createdAt': DateTime.now(),
    }).then((value) {
      _authProvider.isLoading(false);
      showBottomSheetForDriver(context);
      // AppRoutes.push(context, LoginPage());
      _authProvider.carDesignController.clear();
      _authProvider.carDesignController.clear();
      _authProvider.chassisNumberController.clear();
      _authProvider.companyController.clear();
      _authProvider.emailController.clear();
      _authProvider.engineController.clear();
      _authProvider.nameController.clear();
      _authProvider.passwordController.clear();
      _authProvider.phoneNumberController.clear();
      _authProvider.pinCodeController.clear();
      _authProvider.registrationNumberController.clear();

      MyMotionToast.success(
        context,
        "Success".tr,
        'Account created successfully :) '.tr,
      );
    }).catchError((e) {
      print('e: $e');
      MyMotionToast.error(
        context,
        "Oops!".tr,
        'Some thing went wrong Please try again later'.tr,
      );
    });
  }
}
