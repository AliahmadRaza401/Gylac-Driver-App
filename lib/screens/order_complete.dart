import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/providers/user_provider.dart';
import 'package:driver_app/screens/home_screen.dart';
import 'package:driver_app/sevices/fcm_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/style.dart';
import 'package:get/get.dart';

class OrderComplete extends StatefulWidget {
  final dynamic orderData;

  const OrderComplete({Key? key, this.orderData}) : super(key: key);

  @override
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  dynamic ratings = 0.0;
  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    updateData();
  }

  updateData() async {
    if (mounted) {
      var collection = FirebaseFirestore.instance.collection('orders');
      collection
          .doc(widget.orderData["orderId"].toString())
          .update(
            {
              'trackStatus': "Delivered",
            },
          ) // <-- Updated data
          .then((_) => {})
          .catchError((error) => print(' Delivery status failed'));
    }
  }

  updateDriverOrder() {
    var level = userProvider.driverModel!.level;
    int orderCount = userProvider.driverModel!.orderCount += 1;

    if (orderCount >= 20 && userProvider.driverModel!.wallet >= 500) {
      level = 1;
    } else if (orderCount >= 40 && userProvider.driverModel!.wallet >= 1000) {
      level = 2;
    } else if (orderCount >= 80 && userProvider.driverModel!.wallet >= 2000) {
      level = 3;
    } else {
      level = 0;
    }

    FirebaseFirestore.instance
        .collection("drivers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "orderCount": orderCount,
      "level": level,
    }).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Complete".tr),
        centerTitle: true,
        backgroundColor: Color(0xffFBB03B),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                color: const Color(0xff22B428), //Color(0xffD40A0A),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  "Order Completed".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.054,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .26,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: themeColor,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .15,
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                decoration: BoxDecoration(
                                    color: themeColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              // Image.asset(smile,scale: 2.9,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Text(
                                widget.orderData['pickupName'].toString(),
                                style: MyTextStyle.poppins().copyWith(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.28,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.012),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: themeColor.withOpacity(0.20)),
                                  ),
                                  child: Image.asset(
                                    call_icon,
                                    scale: 2.9,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.012),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: themeColor.withOpacity(0.20)),
                                  ),
                                  child: Image.asset(
                                    mail_icon,
                                    scale: 2.9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    height: 10,
                    thickness: 2.5,
                    indent: MediaQuery.of(context).size.width * 0.04,
                    endIndent: MediaQuery.of(context).size.width * 0.04,
                    color: themeColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                            border: Border.all(color: themeColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.03,
                                    top: MediaQuery.of(context).size.height *
                                        0.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        // color: Colors.blue,
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: Image.asset(
                                          dropdown_ani,
                                          scale: 3,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Text(
                                      widget.orderData['userName'].toString(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.12,
                                    ),
                                    Text(
                                      widget.orderData['orderTime'].toString(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: themeColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.093),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        widget.orderData['pickupAddress']
                                            .toString(),
                                        style: MyTextStyle.poppins().copyWith(
                                            color: Colors.grey,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      widget.orderData['distance'].toString(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.012,
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .24,
                              height: MediaQuery.of(context).size.height * .12,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    widget.orderData["vehicle"].toString() ==
                                            "CAR"
                                        ? car
                                        : widget.orderData["vehicle"]
                                                    .toString() ==
                                                "MINI TRUCK"
                                            ? mini_truck
                                            : widget.orderData["vehicle"]
                                                        .toString() ==
                                                    "BIKE"
                                                ? cycle
                                                : widget.orderData["vehicle"]
                                                            .toString() ==
                                                        "SCOOTER"
                                                    ? scooter
                                                    : widget.orderData[
                                                                    "vehicle"]
                                                                .toString() ==
                                                            "TRUCK"
                                                        ? truck
                                                        : van,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.orderData['vehicle'].toString(),
                              style: MyTextStyle.poppins().copyWith(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  ratings = rating;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                // print(" hhhhh ${widget.orderData["userId"]}");
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.orderData["userId"])
                    .update({
                  "rating": ratings,
                  "averageRatings": "5.0",
                }).then((value) {
                  const snackBar = SnackBar(
                    content: Text('FeedBack Done!!'),
                  );
                  FCMServices.sendFCM(
                    "user",
                    userProvider.userModel!.uid.toString(),
                    "Rating Recived",
                    "Driver give $ratings start rating",
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  updateDriverOrder();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverHomeScreen(),
                      ),
                      (route) => false);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .06,
                decoration: BoxDecoration(
                  color: const Color(0xff22B428), //Color(0xffD40A0A),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    "Send FeedBack".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.054,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
