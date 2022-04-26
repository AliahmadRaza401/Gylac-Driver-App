// // ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:driver_app/screens/first_screen.dart';
import 'package:driver_app/screens/home_screen.dart';
import 'package:driver_app/screens/intro_screens.dart';
import 'package:driver_app/screens/login.dart';
import 'package:driver_app/screens/onBoard.dart';
import 'package:driver_app/screens/onBoarding/on_boarding_screen.dart';
import 'package:driver_app/sevices/shared_pref_services.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:driver_app/utils/color.dart';
import 'package:driver_app/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // print("Function start");
    getUser();
    checkStarted();
    Timer(Duration(seconds: 5), finished);
  }

  var start;
  checkStarted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getBool('Started');

    setState(() {
      start = value;
    });
    print('start: $start');
    return start;
  }

  bool userLogin = false;

  getUser() async {
    userLogin = await SharedPrefServices.getUserLoggedIn();
    print('userLogin: $userLogin');
  }

  void finished() {
    if (userLogin == true) {
      AppRoutes.replace(context, DriverHomeScreen());
    } else {
      start == true
          ? Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Intro()))
          : Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OnBoarding()));
    }
    // print("completed");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
          body: Center(
              child: Image.asset(
        logo,
        width: 965.47.w,
        height: 948.h,
      ))),
    );
  }
}
