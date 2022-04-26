// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Customdialog{
  static void showDialog(){
    AlertDialog(
        content: SingleChildScrollView(
          child:  Center(child: SpinKitFadingCircle(
      size: 30,
      color: Color(0xffFBB03B),
    )),
  
        ),
      // barrierColor: Colors.grey[100],
    );
  }
  static void closeDialog(BuildContext context)
  {
    Navigator.of(context).pop();
  }
}