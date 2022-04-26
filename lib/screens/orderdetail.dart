// // // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, sized_box_for_whitespace, avoid_unnecessary_containers
// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, sized_box_for_whitespace, avoid_unnecessary_containers
// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, sized_box_for_whitespace, avoid_unnecessary_containers
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/providers/user_provider.dart';
import 'package:driver_app/screens/chat/chat_handler.dart';
import 'package:driver_app/screens/chat/chat_room.dart';
import 'package:driver_app/screens/chat/model/chat_room_model.dart';
import 'package:driver_app/screens/chat/model/user_model.dart';
import 'package:driver_app/screens/driver_drawer.dart';
import 'package:driver_app/sevices/fcm_services.dart';
import 'package:driver_app/utils/constants.dart';
import 'package:driver_app/utils/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_route.dart';
import '../utils/color.dart';
import '../utils/strings.dart';
import '../utils/style.dart';
import '../widgets/small_details_container.dart';
import 'map/go_map.dart';

class OrderDetail extends StatefulWidget {
  final dynamic orderData;

  const OrderDetail({this.orderData});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  bool isDelivery = false;

  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getUserDataByID(widget.orderData['userId']);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.orderData.toString());
    // print("USer Model : ${userProvider.userModel!.email.toString()}");
    return Scaffold(
      key: scaffoldState,
      drawer: DriverDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        toolbarHeight: 185.h,
        leading: GestureDetector(
          onTap: () => scaffoldState.currentState!.openDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 77.h,
              width: 77.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(drawer_icon))),
            ),
          ),
        ),
        title: Text(OrderDetails.tr),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.025),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.025),
                        border: Border.all(width: 1, color: Colors.orange)),
                    child: ExpansionTile(
                      title: SizedBox(
                        width: 100,
                        child: Text(
                          pickupdetails.tr,
                          style: MyTextStyle.poppinsBold()
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      leading: Image.asset(
                        pickup_icon,
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      trailing: Image.asset(dropdown, scale: 3),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(rec),
                            )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    smallDetailsContainer(context, SentiarParis,
                                        "11m.20s", Arrondisment, "4.8KM"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                            widget.orderData["vehicle"]
                                                        .toString() ==
                                                    "CAR"
                                                ? car
                                                : widget.orderData["vehicle"]
                                                            .toString() ==
                                                        "MINI TRUCK"
                                                    ? mini_truck
                                                    : widget.orderData[
                                                                    "vehicle"]
                                                                .toString() ==
                                                            "BIKE"
                                                        ? cycle
                                                        : widget.orderData[
                                                                        "vehicle"]
                                                                    .toString() ==
                                                                "SCOOTER"
                                                            ? scooter
                                                            : widget.orderData[
                                                                            "vehicle"]
                                                                        .toString() ==
                                                                    "TRUCK"
                                                                ? truck
                                                                : van,
                                            width: 50,
                                            height: 50),
                                      ),
                                    ),
                                    Text(
                                      widget.orderData["vehicle"].toString(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.025),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.025),
                        border: Border.all(width: 1, color: Colors.orange)),
                    child: ExpansionTile(
                      title: Text(
                        DeliveryDETAILS.toUpperCase().tr,
                        style: MyTextStyle.poppinsBold()
                            .copyWith(color: Colors.black),
                      ),
                      leading: Image.asset(
                        delivery_icon,
                        height: 106.h,
                        width: 199.w,
                      ),
                      trailing: Image.asset(dropdown, scale: 3),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(rec),
                            )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    smallDetailsContainer(context, SentiarParis,
                                        "11m.20s", Arrondisment, "4.8KM"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          widget.orderData["vehicle"]
                                                      .toString() ==
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
                                                      : widget.orderData[
                                                                      "vehicle"]
                                                                  .toString() ==
                                                              "SCOOTER"
                                                          ? scooter
                                                          : widget.orderData[
                                                                          "vehicle"]
                                                                      .toString() ==
                                                                  "TRUCK"
                                                              ? truck
                                                              : van,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.orderData["vehicle"].toString(),
                                      style: MyTextStyle.poppins().copyWith(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color:Colors.blue,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index1) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.black,
                      child: Column(
                        children: [
                          userProfileDetails(
                              pickup_icon,
                              widget.orderData['pickupName'],
                              widget.orderData['userName'],
                              widget.orderData['pickupAddress'].toString(),
                              widget.orderData['orderTime'].toString(),
                              widget.orderData['distance'],
                              widget.orderData['vehicle'].toString()),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          orderDetails(
                              widget.orderData['pickupParcelDesc'].toString(),
                              widget.orderData['pickupParcelWeight'].toString(),
                              widget.orderData['pickupDeliveryPrice']
                                  .toString(),
                              widget.orderData['pickupDeliveryPrice']
                                  .toString(),
                              widget.orderData['distance'].toString(),
                              widget.orderData['duration'].toString(),
                              "# ${widget.orderData["orderId"].toString()}"),
                          isDelivery == false
                              ? GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GoMap(
                                                  pickUpLat: double.parse(widget
                                                      .orderData["pickupLat"]),
                                                  pickUpLong: double.parse(
                                                      widget.orderData[
                                                          "pickupLong"]),
                                                  dropLat: double.parse(
                                                      widget.orderData[
                                                          "deliveryLat"]),
                                                  dropLong: double.parse(
                                                      widget.orderData[
                                                          "deliveryLong"]),
                                                  driverID: widget
                                                      .orderData["driverId"]
                                                      .toString(),
                                                  data: widget.orderData,
                                                  isPickup: false,
                                                ))).then((value) {
                                      if (mounted) {
                                        var collection = FirebaseFirestore
                                            .instance
                                            .collection('orders');
                                        collection
                                            .doc(widget.orderData["orderId"]
                                                .toString())
                                            .update(
                                              {
                                                'trackStatus': "Picked",
                                              },
                                            ) // <-- Updated data
                                            .then((_) => {
                                                  setState(() {
                                                    isDelivery = true;
                                                  }),
                                                })
                                            .catchError((error) =>
                                                print(' update status failed'));
                                      }
                                    });

                                    FCMServices.sendFCM(
                                      "user",
                                      widget.orderData["userId"].toString(),
                                      "Driver Start Naivigation",
                                      "Driver start moving to PickUp Location",
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                    height: MediaQuery.of(context).size.height *
                                        0.068,
                                    width: MediaQuery.of(context).size.width *
                                        0.98,
                                    decoration: BoxDecoration(
                                        color: themeColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ConfirmationSlider(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        foregroundColor: Colors.white,
                                        text: "PICKUP AT LOCATION".tr,
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.047,
                                            fontWeight: FontWeight.bold),
                                        iconColor: themeColor,
                                        backgroundShape:
                                            BorderRadius.circular(5),
                                        backgroundColor: themeColor,
                                        onConfirmation: () {}),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GoMap(
                                                  pickUpLat: double.parse(widget
                                                      .orderData["pickupLat"]),
                                                  pickUpLong: double.parse(
                                                      widget.orderData[
                                                          "pickupLong"]),
                                                  dropLat: double.parse(
                                                      widget.orderData[
                                                          "deliveryLat"]),
                                                  dropLong: double.parse(
                                                      widget.orderData[
                                                          "deliveryLong"]),
                                                  isPickup: true,
                                                  driverID: widget
                                                      .orderData["driverId"]
                                                      .toString(),
                                                  data: widget.orderData,
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                    height: MediaQuery.of(context).size.height *
                                        0.068,
                                    width: MediaQuery.of(context).size.width *
                                        0.98,
                                    decoration: BoxDecoration(
                                        color: themeColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ConfirmationSlider(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        foregroundColor: Colors.white,
                                        text: DELIVERATLOCATION.tr,
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.047,
                                            fontWeight: FontWeight.bold),
                                        iconColor: themeColor,
                                        backgroundShape:
                                            BorderRadius.circular(5),
                                        backgroundColor: themeColor,
                                        onConfirmation: () {}),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderDetails(String parcelName, String weight, String totalAmount,
      String subtotal, String distance, String time, String orderid) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.04,
              right: MediaQuery.of(context).size.height * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ParcelName.tr,
                    style: MyTextStyle.poppins().copyWith(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    Weight.tr,
                    style: MyTextStyle.poppins().copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parcelName,
                    style: MyTextStyle.poppins().copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    weight,
                    style: MyTextStyle.poppins().copyWith(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffFBB03B),
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.0,
                  right: MediaQuery.of(context).size.height * 0.0,
                  top: MediaQuery.of(context).size.height * 0.006,
                  bottom: MediaQuery.of(context).size.height * 0.006),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(SUBTOTAL.tr,
                            style: MyTextStyle.poppins().copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              color: Colors.black54,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(TOTAL.tr,
                            style: MyTextStyle.poppins().copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              color: Colors.black54,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$subtotal MNL",
                            style: MyTextStyle.poppins().copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.014,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text("$totalAmount MNL",
                            style: MyTextStyle.poppins().copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.005,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Distance.tr,
                          style: MyTextStyle.poppins().copyWith(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.014,
                            color: Colors.black54,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: 70,
                        height: 20,
                        child: Text(Time.tr,
                            style: MyTextStyle.poppins().copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              color: Colors.black54,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(distance,
                          style: MyTextStyle.poppins().copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(time,
                          style: MyTextStyle.poppins().copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            )),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.027),
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(rec2),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ORDERID.tr,
                  style: MyTextStyle.poppins().copyWith(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  orderid,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.poppins().copyWith(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget userProfileDetails(String profImg, String name, String city,
      String address, String time, String distance, String vehicle) {
    return Container(
      height: 1041.h,
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
                        height: MediaQuery.of(context).size.height * .07,
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          profile,
                          scale: 2.9,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        //  color: Colors.amber,
                        width: MediaQuery.of(context).size.width * .35,
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.poppins().copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
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
                        GestureDetector(
                          onTap: () async {
                            var url =
                                "tel:${userProvider.driverModel!.mobileNumber}";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.012),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.12,
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
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        InkWell(
                          onTap: () async {
                            ChatRoomModel? chatRoomModel =
                                await chatHandler.getChatRoom(
                                    userProvider.userModel!.uid,
                                    FirebaseAuth.instance.currentUser!.uid);

                            if (chatRoomModel != null) {
                              AppRoutes.push(
                                  context,
                                  ChatRoom(
                                    targetUser: ChatDriverModel(
                                      uid: userProvider.userModel!.uid
                                          .toString(),
                                      fullname: userProvider.userModel!.fullname
                                          .toString(),
                                      email: userProvider.userModel!.email
                                          .toString(),
                                      profilepic: userProvider
                                          .userModel!.profilepic
                                          .toString(),
                                    ),
                                    userModel: ChatDriverModel(
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid,
                                      fullname: userProvider
                                          .driverModel!.fullName
                                          .toString(),
                                      email: userProvider.driverModel!.email
                                          .toString(),
                                      profilepic: userProvider.driverModel!.dp
                                          .toString(),
                                    ),
                                    chatRoom: chatRoomModel,
                                  ));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.012),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.12,
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
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(color: themeColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            top: MediaQuery.of(context).size.height * 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                // color: Colors.blue,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02),
                                child: Image.asset(
                                  dropdown_ani,
                                  scale: 2.2,
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025,
                            ),
                            Container(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width * .3,

                              child: Text(
                                city,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MyTextStyle.poppins().copyWith(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.2,
                            // ),
                            Container(
                              // color: Colors.amber,
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width * .18,
                              child: Text(
                                time,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MyTextStyle.poppins().copyWith(
                                    color: themeColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // color: Colors.amber,

                              width: MediaQuery.of(context).size.width * .35,
                              child: Text(
                                address,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MyTextStyle.poppins().copyWith(
                                    color: Colors.grey,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              distance,
                              style: MyTextStyle.poppins().copyWith(
                                  color: black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.014,
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .25,
                      height: MediaQuery.of(context).size.height * .12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            widget.orderData["vehicle"].toString() == "CAR"
                                ? car
                                : widget.orderData["vehicle"].toString() ==
                                        "MINI TRUCK"
                                    ? mini_truck
                                    : widget.orderData["vehicle"].toString() ==
                                            "BIKE"
                                        ? cycle
                                        : widget.orderData["vehicle"]
                                                    .toString() ==
                                                "SCOOTER"
                                            ? scooter
                                            : widget.orderData["vehicle"]
                                                        .toString() ==
                                                    "TRUCK"
                                                ? truck
                                                : van,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      vehicle,
                      style: MyTextStyle.poppins().copyWith(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.025,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 2.5,
            indent: MediaQuery.of(context).size.width * 0.04,
            endIndent: MediaQuery.of(context).size.width * 0.04,
            color: themeColor,
          ),
          Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.01),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ParcelDescription.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: MyTextStyle.poppins().copyWith(
                      color: themeColor,
                      fontSize: MediaQuery.of(context).size.width * 0.032,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    // "asdfk lkasd fl ilsdjf  lasjdf l jlsdfk lkasjdf  lkasjdf l llasdf",
                    widget.orderData['pickupParcelDesc'].toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    style: MyTextStyle.poppins().copyWith(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.032,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// pickupParcelDesc