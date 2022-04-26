// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'package:driver_app/screens/login.dart';
import 'package:driver_app/screens/sign_up.dart';
import 'package:driver_app/sevices/shared_pref_services.dart';
import 'package:driver_app/utils/strings.dart';
import 'package:flutter/material.dart';
import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/style.dart';

class FirstScreen extends StatefulWidget {
  // const FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffFBB03B),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    // spreadRadius: 5,
                    blurRadius: 7,

                    offset: Offset(0, 6), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.04),
                      child: Text(language.toUpperCase(),
                          style: MyTextStyle.poppins().copyWith(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w900))),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelect = !isSelect;
                      });
                    },
                    child: Material(
                        elevation: 10,
                        color: Color(0xffFBB03B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          language1image,
                          height: 30,
                          width: 30,
                        )),
                  ),
                ],
              ),
            ),

            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image2), fit: BoxFit.fill)),
                ),
                isSelect == true
                    ? SizedBox(
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  shape: const StadiumBorder(),
                                  color: themeColor,
                                  onPressed: () {
                                    var locale = const Locale('en', 'US');
                                    // Get.updateLocale(locale);
                                    setState(() {
                                      isSelect = false;
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  child: Text(English.toUpperCase(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          fontWeight: FontWeight.w900)),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    var locale = const Locale('es', 'ES');
                                    // Get.updateLocale(locale);
                                    setState(() {
                                      isSelect = false;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  shape: const StadiumBorder(),
                                  color: themeColor,
                                  child: Text(Mongolian.toUpperCase(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          fontWeight: FontWeight.w900)),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            // SizedBox(height: MediaQuery.of(context).size.height *0.035,),
            // SizedBox(height:MediaQuery.of(context).size.height *0.08 ,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));

                  // Get.to(SignUpScreen());
                },
                color: themeColor,
                child: Text(
                  SignUp.toUpperCase(),
                  style: MyTextStyle.roboto().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "or".toUpperCase(),
                style: MyTextStyle.roboto().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontFamily: "Brand-Bold"),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                color: themeColor,
                child: Text(
                  login.toUpperCase(),
                  style: MyTextStyle.roboto().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
