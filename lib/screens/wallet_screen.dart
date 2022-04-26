// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:driver_app/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  dynamic data1, rs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async {
    await getData();
  }

  Future<dynamic> getData() async {
    print("get data.....");
    final DocumentReference document = FirebaseFirestore.instance
        .collection("drivers")
        .doc(FirebaseAuth.instance.currentUser?.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data1 = snapshot.data;
        print('data1: $data1');

        rs = data1()['wallet'];
        print('RS: $rs');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AppRoutes.pop(context);
              // scaffoldState.currentState!.openDrawer();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'asset/appMenu.png',
                height: 70.h,
              ),
            ),
          ),
          title: Text(
            "My wallet".tr,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: orange,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 848.w,
                    height: 414.h,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          rs == null ? "\$ 0.0" : '\$ $rs',
                          style: TextStyle(
                              color: orange,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * .12),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current Balance".tr,
                              style: TextStyle(
                                color: orange,
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              Container(
                width: 848.w,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Net Income".tr,
                          style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 848.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: orange),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Withdrawn".tr,
                          style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 848.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: orange),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Available for Withdrawal".tr,
                          style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 848.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: orange),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget postNametile(
      String username, String postName, String date, String amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .05,
            height: MediaQuery.of(context).size.height * .05,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(.5)),
                shape: BoxShape.circle),
            child: Text(
              "\$",
              style: TextStyle(color: Colors.white),
            )),
      ),
      title: Text(username),
      subtitle: Text(postName),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(date),
          Text(amount),
        ],
      ),
    );
  }

  Widget tile(String username, String date, var amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .05,
            height: MediaQuery.of(context).size.height * .05,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(.5)),
                shape: BoxShape.circle),
            child: Text(
              "\$",
              style: TextStyle(color: Colors.white),
            )),
      ),
      title: Text(username),
      subtitle: Text(date),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$ ${amount.toString()}",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
