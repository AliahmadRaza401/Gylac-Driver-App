// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LogoutOverlay extends StatefulWidget {
  String message;
  LogoutOverlay({required this.message}) ;
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
    with SingleTickerProviderStateMixin {
  //  AnimationController controller;
   late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    // controller =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    // scaleAnimation =
    //     CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    // controller.addListener(() {
    //   setState(() {});
    // });

    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 180.0,
              decoration: ShapeDecoration(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, right: 20.0),
                    child: Text(
                      widget.message,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 10.0, top: 10.0, bottom: 10.0),
                          child: ButtonTheme(
                              height: 35.0,
                              minWidth: 110.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all<BorderSide>(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                child: Text("ok"),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                              ))),
                    ],
                  ))
                ],
              )),
        ),
      ),
    );
  }
}
