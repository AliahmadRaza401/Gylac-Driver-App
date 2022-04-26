// ignore_for_file: must_be_immutable, prefer_final_fields, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/providers/user_provider.dart';
import 'package:driver_app/screens/driver_drawer.dart';
import 'package:driver_app/screens/login.dart';
import 'package:driver_app/screens/order_complete.dart';
import 'package:driver_app/screens/orderdetail.dart';
import 'package:driver_app/sevices/fcm_services.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';
import '../utils/style.dart';

class DriverHomeScreen extends StatefulWidget {
  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  // DriverHomeScreen({Key key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  List order = [];

  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getDriverDataByID(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    bool loading = Provider.of<UserProvider>(context).loading;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: scaffoldState,
          drawer: DriverDrawer(),
          body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              // color: Colors.green,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                            // border: Border.all(),
                            image: DecorationImage(
                                image: AssetImage(signUpBg),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () => scaffoldState.currentState!.openDrawer(),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.13,
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              drawer_icon,
                              color: themeColor,
                            ),
                          ),
                        ),
                      ),
                      loading
                          ? CircularProgressIndicator(
                              color: Colors.orange,
                            )
                          : userProvider.driverModel!.status == "pending"
                              ? ordersBody(context)
                              : showAlertSheet(),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget noOrder(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width * 0.44,
            decoration: BoxDecoration(
                // border: Border.all(),
                image: DecorationImage(
                    image: AssetImage(no_order), fit: BoxFit.contain)),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(5)),
              child: MaterialButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () async {
                  // Get.to(AllOrderScreen());
                },
                color: themeColor,
                child: Text(
                  NOORDER.toUpperCase(),
                  style: MyTextStyle.roboto().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ordersBody(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .15),
        child: Container(
          // color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .82,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                return const Text('Oops! Something went wrong');
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: orange,
                  ),
                );
              }
              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'asset/noOrder.png',
                      width: 613.w,
                      height: 491.h,
                    ),
                    // Text("Nothing to show!!"),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index1) {
                      final data = docs[index1].data();

                      if ((data['rejections'] as List).contains(
                              FirebaseAuth.instance.currentUser!.uid) ==
                          false) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.52,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(rec),
                                  )),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.007),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: themeColor,
                                                  spreadRadius: 1),
                                            ]),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.015,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02),
                                              child: Image.asset(
                                                dropdown_ani,
                                                scale: 2.2,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              50,
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .3,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        SentiarParis,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: MyTextStyle
                                                                .poppins()
                                                            .copyWith(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .22,
                                                      // color: Colors.amber,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        data["orderTime"]
                                                            .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: MyTextStyle
                                                                .poppins()
                                                            .copyWith(
                                                          color: themeColor,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.028,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              50,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .3,
                                                      child: Text(
                                                        data["deliveryAddress"]
                                                            .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: MyTextStyle
                                                                .poppins()
                                                            .copyWith(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .2,
                                                      // color: Colors.amber,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        data["distance"]
                                                            .toString(),
                                                        style: MyTextStyle
                                                                .poppins()
                                                            .copyWith(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.028,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .1,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    data["vehicle"]
                                                                .toString() ==
                                                            "CAR"
                                                        ? car
                                                        : data["vehicle"]
                                                                    .toString() ==
                                                                "MINI TRUCK"
                                                            ? mini_truck
                                                            : data["vehicle"]
                                                                        .toString() ==
                                                                    "BIKE"
                                                                ? cycle
                                                                : data["vehicle"]
                                                                            .toString() ==
                                                                        "SCOOTER"
                                                                    ? scooter
                                                                    : data["vehicle"].toString() ==
                                                                            "TRUCK"
                                                                        ? truck
                                                                        : van,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            // color: Colors.amber,
                                            alignment: Alignment.center,
                                            child: Text(
                                              data["vehicle"].toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: MyTextStyle.poppins()
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.04,
                                    right: MediaQuery.of(context).size.height *
                                        0.04),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ParcelName.tr,
                                          style: MyTextStyle.poppins().copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          Weight.tr,
                                          style: MyTextStyle.poppins().copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          // color: Colors.amber,
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            data["pickupName"].toString(),
                                            style:
                                                MyTextStyle.poppins().copyWith(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          // color: Colors.amber,
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            data["pickupParcelWeight"]
                                                .toString(),
                                            style:
                                                MyTextStyle.poppins().copyWith(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xffFBB03B),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height *
                                          0.02,
                                      right:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      top: MediaQuery.of(context).size.height *
                                          0.006,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.006),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Order Price".tr,
                                                style: MyTextStyle.poppins()
                                                    .copyWith(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.022,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3,
                                              // color: Colors.amber,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "${data["pickupDeliveryPrice"].toString()} MNL",
                                                  style: MyTextStyle.poppins()
                                                      .copyWith(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.021,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.005,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(Dstance.tr,
                                              style: MyTextStyle.poppins()
                                                  .copyWith(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.018,
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          SizedBox(
                                            width: 50,
                                            height: 20,
                                            child: FittedBox(
                                              child: Text(Time.tr,
                                                  style: MyTextStyle.poppins()
                                                      .copyWith(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.018,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                      // SizedBox(
                                      //   width:
                                      //       MediaQuery.of(context).size.height *
                                      //           0.03,
                                      // ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .23,
                                            // color: Colors.amber,
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                data["distance"].toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: MyTextStyle.poppins()
                                                    .copyWith(
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.04,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .23,
                                            // color: Colors.amber,
                                            alignment: Alignment.centerRight,
                                            child: Wrap(
                                              children: [
                                                Text(
                                                    data["duration"].toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: MyTextStyle.poppins()
                                                        .copyWith(
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.04,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              data["orderStatus"] == "Pending"
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              List rList = data['rejections'];

                                              rList.add(FirebaseAuth
                                                  .instance.currentUser!.uid);

                                              var val = int.parse(
                                                      data['rejectCount']
                                                          .toString()) +
                                                  1;
                                              await FirebaseFirestore.instance
                                                  .collection("orders")
                                                  .doc(snapshot
                                                      .data!.docs[index1].id)
                                                  .update(
                                                {
                                                  'rejections': rList,
                                                  'rejectCount': val,
                                                },
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                  color: Colors
                                                      .red, //Color(0xffD40A0A),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 0.5,
                                                        color: Colors.black,
                                                        spreadRadius: 0.1),
                                                  ]),
                                              child: Text(
                                                "Reject",
                                                style: MyTextStyle.roboto()
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.042,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await userProvider
                                                  .getUserDataByID(
                                                      data['userId']);
                                              log("Id ${userProvider.userModel!.uid.toString()}");
                                              await FirebaseFirestore.instance
                                                  .collection("orders")
                                                  .doc(snapshot
                                                      .data!.docs[index1].id)
                                                  .update(
                                                {
                                                  'driverId': FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid,
                                                  'orderStatus': "Accepted",
                                                },
                                              );
                                              FCMServices.sendFCM(
                                                "user",
                                                userProvider.userModel!.uid
                                                    .toString(),
                                                "Congratulations!",
                                                "Your Order is Accepted",
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                  color: Color(
                                                      0xff22B428), //Color(0xffD40A0A),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 0.5,
                                                        color: Colors.black,
                                                        spreadRadius: 0.1),
                                                  ]),
                                              child: Text(
                                                "Accept",
                                                style: MyTextStyle.roboto()
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.042,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          data['driverId'] ==
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid &&
                                                  data['orderStatus'] ==
                                                      "Accepted"
                                              ? GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderDetail(
                                                          orderData: data,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    decoration: BoxDecoration(
                                                        color: Color(
                                                            0xff22B428), //Color(0xffD40A0A),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              blurRadius: 0.5,
                                                              color:
                                                                  Colors.black,
                                                              spreadRadius:
                                                                  0.1),
                                                        ]),
                                                    child: Text(
                                                      "View Details".tr,
                                                      style: MyTextStyle
                                                              .roboto()
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.042,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.035,
                                    left: MediaQuery.of(context).size.width *
                                        0.06,
                                    top: MediaQuery.of(context).size.height *
                                        0.02),
                                child: Divider(
                                  thickness: 3.5,
                                  color: Colors.black,
                                  height: 3,
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget showAlertSheet() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      height: MediaQuery.of(context).size.height * 0.55,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain, image: AssetImage(otp_popup_bg)),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.08),
          color: Colorsansparent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(signup_popup),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sorry! your document is under review wait until your profile approved",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.020,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.017,
                ),
                Text(
                  soonyourrecivemail,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.020,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  withdetails,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.020,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.32,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.01)),
                child: Center(
                  child: Text(
                    okay,
                    style: TextStyle(
                        color: const Color(0xffFF0500),
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
