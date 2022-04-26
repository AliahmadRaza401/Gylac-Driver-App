// ignore_for_file: prefer_final_fields, unnecessary_new, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:driver_app/screens/my_orders.dart';
import 'package:driver_app/widgets/small_details_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';
import '../utils/style.dart';

class NewTaskScreen extends StatefulWidget {
  // const NewTaskScreen({Key key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

// class MyItem {
//   MyItem({this.isExpanded: false, this.header, this.body});

//   bool isExpanded;
//   final String header;
//   final String body;
// }

class _NewTaskScreenState extends State<NewTaskScreen> {
  // List<MyItem> _items = <MyItem>[
  //   new MyItem(
  //     header: 'Why u should make an FAQ page',
  //     body:
  //         'Sure there are chatbots,support,lines and customer review to help shoppers on their path to purchase',
  //   ),
  // ];
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
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 77.h,
                width: 77.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(vectr))),
              ),
            ),
            title: Text(NewTask),
          ),
          body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                   
                   
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
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
                                ParcelName,
                                style: MyTextStyle.poppins().copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                Weight,
                                style: MyTextStyle.poppins().copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                Fazsam,
                                style: MyTextStyle.poppins().copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                "20 kg",
                                style: MyTextStyle.poppins().copyWith(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.black,
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
                              left: MediaQuery.of(context).size.height * 0.02,
                              right: MediaQuery.of(context).size.height * 0.02,
                              top: MediaQuery.of(context).size.height * 0.006,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.006),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.01),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(PriceOrder,
                                        style: MyTextStyle.poppins().copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.022,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text("1000 MNT",
                                        style: MyTextStyle.poppins().copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.021,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Dstance,
                                      style: MyTextStyle.poppins().copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(Time,
                                      style: MyTextStyle.poppins().copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("5 km",
                                      style: MyTextStyle.poppins().copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text("10 min",
                                      style: MyTextStyle.poppins().copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.064,
                            width: MediaQuery.of(context).size.width * 0.37,
                            decoration: BoxDecoration(
                                color: const Color(0xffD40A0A),
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      spreadRadius: 0.1),
                                ]),
                            child: Text(
                              REJECT,
                              style: MyTextStyle.poppinsBold().copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.042,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyOrderScreen()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height:
                                  MediaQuery.of(context).size.height * 0.063,
                              width: MediaQuery.of(context).size.width * 0.37,
                              decoration: BoxDecoration(
                                  color: Color(0xff22B428),
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.5,
                                        color: Colors.black,
                                        spreadRadius: 0.1),
                                  ]),
                              child: Text(
                                Accept,
                                style: MyTextStyle.poppinsBold().copyWith(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.042,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 10.w,
                      indent: 15.w,
                      endIndent: 15.w,
                    )
                  ]),
                );
              })),
    );
  }
}
