// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:driver_app/screens/orderdetail.dart';
import 'package:driver_app/utils/image.dart';
import 'package:driver_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';
import '../utils/style.dart';
import '../widgets/small_details_container.dart';

class MyOrderScreen extends StatefulWidget {
  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: themeColor,
          centerTitle: true,
          toolbarHeight: 185.h,
          leading: Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              height: 77.h,
              width: 77.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(vectr))),
            ),
          ),
          title: Text(myOrders),
        ),
        //  appBarCustom("My Orders".toUpperCase(), menu_box),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index1) {
                  return GestureDetector(
                      onTap: () {},
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.03),
                            // height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.99,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: themeColor),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.grey,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0)
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          greenHeading(context, 
                                              DeliveryDETAILS,
                                          
                                          ),
                                          smallDetailsContainer(
                                            context,

                                              SentiarParis,
                                              "11m.20s",
                                              Arrondisment,
                                              "4.8KM"),
                                              greenHeading(context, 
                                              pickupdetails,
                                              
                                              ),
                                          smallDetailsContainer(
                                            context,
                                              SentiarParis,
                                              "11m.20s",
                                              Arrondisment,
                                              "4.8KM"),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 25),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .13,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  van,
                                                ),
                                              ),
                                            ),
                                            child: Image.asset(
                                              truck,
                                              scale: 4,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                            child: Text(
                                              MINITRUCK,
                                              style: MyTextStyle.poppins()
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderDetail()));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                        color: themeColor,
                                        borderRadius: BorderRadius.circular(7),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 0.5,
                                              color: Colors.black,
                                              spreadRadius: 0.1),
                                        ]),
                                    child: Text(
                                      ViewDetail,
                                      style: MyTextStyle.poppinsBold().copyWith(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
          ],
        )),
      ),
    );
  }

  
}
