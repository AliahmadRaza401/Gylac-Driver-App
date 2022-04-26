// ignore_for_file: use_key_in_widget_constructors

import 'package:driver_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        child: SpinKitFadingCircle(
          color: themeColor,
          size: 30,
        )
    );
  }
}
