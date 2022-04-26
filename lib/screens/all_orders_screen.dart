
// // ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, sized_box_for_whitespace

// import 'package:driver_app/screens/newtaskk.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';

// import '../utils/color.dart';
// import '../utils/image.dart';
// import '../utils/style.dart';


// class AllOrderScreen extends StatefulWidget {
//   // const AllOrderScreen({Key key}) : super(key: key);

//   @override
//   _AllOrderScreenState createState() => _AllOrderScreenState();
// }

// class _AllOrderScreenState extends State<AllOrderScreen> {
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: scaffoldState,
//         backgroundColor: Colors.white,
//          appBar:AppBar(
           
//           backgroundColor: themeColor,
//           centerTitle: true,
//           toolbarHeight: 185.h,
//           leading:GestureDetector(
//             onTap: () => scaffoldState.currentState!.openDrawer(),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                   height: 77.h,
//                   width: 77.w,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(image: AssetImage(drawer_icon))
//                 ),
//               ),
//             ),
//           ),
//           title: Text("Order Details"),
//         ),
//         body: ListView(
//           children: [
//             ListView.builder(
//               scrollDirection: Axis.vertical,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index1) {
//                 return Container(
//                   height: Get.height * 0.52,
//                   width: Get.width,
//                   // color: Colors.black,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: Get.height * 0.18,
//                           width: Get.width,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(rec),
//                               )),
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     left: Get.width * 0.04,
//                                     top: Get.height * 0.007),
//                                 height: Get.height * 0.09,
//                                 width: Get.width * 0.65,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: themeColor, spreadRadius: 1),
//                                     ]),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       height: Get.height * 0.05,
//                                       alignment: Alignment.topLeft,
//                                       margin: EdgeInsets.only(
//                                           left: Get.width * 0.045,
//                                           top: Get.height * 0.02),
//                                       child: Image.asset(
//                                         dropdown_ani,
//                                         scale: 2.2,
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Sentiar, Paris",
//                                               style: MyTextStyle.poppins()
//                                                   .copyWith(
//                                                 color: Colors.black,
//                                                 fontSize: Get.width * 0.036,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: Get.width * 0.1,
//                                             ),
//                                             Text(
//                                               "11m.20s",
//                                               style: MyTextStyle.poppins()
//                                                   .copyWith(
//                                                 color: themeColor,
//                                                 fontSize: Get.width * 0.036,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 3,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "14th Arrondisment",
//                                               style: MyTextStyle.poppins()
//                                                   .copyWith(
//                                                 color: Colors.black,
//                                                 fontSize: Get.width * 0.032,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: Get.width * 0.06,
//                                             ),
//                                             Text(
//                                               "4.8KM",
//                                               style: MyTextStyle.poppins()
//                                                   .copyWith(
//                                                 color: Colors.black,
//                                                 fontSize: Get.width * 0.032,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 8.0),
//                                     child: Container(
//                                       width: Get.width * .2,
//                                       height: Get.height * .1,
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               image: AssetImage(red_circle))),
//                                       child: Image.asset(
//                                         truck,
//                                         scale: 4,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "MINI TRUCK",
//                                     style: MyTextStyle.poppins().copyWith(
//                                         color: Colors.black,
//                                         fontSize: Get.width * 0.03,
//                                         fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.01,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             left: Get.height * 0.04, right: Get.height * 0.04),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Parcel Name",
//                                   style: MyTextStyle.poppins().copyWith(
//                                     fontSize: Get.height * 0.018,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: Get.height * 0.02,
//                                 ),
//                                 Text(
//                                   "Weight",
//                                   style: MyTextStyle.poppins().copyWith(
//                                     fontSize: Get.height * 0.018,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   "Faz sam (order)",
//                                   style: MyTextStyle.poppins().copyWith(
//                                     fontSize: Get.height * 0.018,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: Get.height * 0.02,
//                                 ),
//                                 Text(
//                                   "20 kg",
//                                   style: MyTextStyle.poppins().copyWith(
//                                     fontSize: Get.height * 0.018,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.02,
//                       ),
//                       Container(
//                           height: Get.height * 0.1,
//                           width: Get.width,
//                           color: Color(0xffFBB03B),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 left: Get.height * 0.02,
//                                 right: Get.height * 0.02,
//                                 top: Get.height * 0.006,
//                                 bottom: Get.height * 0.006),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.only(left: Get.width * 0.03),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("Price Order",
//                                           style: MyTextStyle.poppins().copyWith(
//                                               fontSize: Get.height * 0.022,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold)),
//                                       SizedBox(
//                                         height: Get.height * 0.01,
//                                       ),
//                                       Text("1000 MNT",
//                                           style: MyTextStyle.poppins().copyWith(
//                                             fontSize: Get.height * 0.021,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white,
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: Get.width * 0.15,
//                                 ),
//                                 Container(
//                                   height: Get.height,
//                                   width: Get.width * 0.005,
//                                   color: Colors.black,
//                                 ),
//                                 SizedBox(
//                                   width: Get.width * 0.03,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("Dstance:",
//                                         style: MyTextStyle.poppins().copyWith(
//                                           fontSize: Get.height * 0.018,
//                                           color: Colors.black,
//                                         )),
//                                     SizedBox(
//                                       height: Get.height * 0.01,
//                                     ),
//                                     Text("Time:",
//                                         style: MyTextStyle.poppins().copyWith(
//                                           fontSize: Get.height * 0.018,
//                                           color: Colors.black,
//                                         ))
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: Get.height * 0.03,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("5 km",
//                                         style: MyTextStyle.poppins().copyWith(
//                                             fontSize: Get.height * 0.018,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold)),
//                                     SizedBox(
//                                       height: Get.height * 0.01,
//                                     ),
//                                     Text("10 min",
//                                         style: MyTextStyle.poppins().copyWith(
//                                             fontSize: Get.height * 0.018,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold))
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             top: Get.height * 0.03, left: Get.width * 0.03),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () => Get.to(NewTaskScreen()),
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: Get.height * 0.059,
//                                 width: Get.width * 0.4,
//                                 decoration: BoxDecoration(
//                                     color:
//                                         Color(0xff22B428), //Color(0xffD40A0A),
//                                     borderRadius: BorderRadius.circular(7),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           blurRadius: 0.5,
//                                           color: Colors.black,
//                                           spreadRadius: 0.1),
//                                     ]),
//                                 child: Text(
//                                   "View Detail".toUpperCase(),
//                                   style: MyTextStyle.roboto().copyWith(
//                                       color: Colors.white,
//                                       fontSize: Get.width * 0.042,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                             // Container(
//                             //   alignment: Alignment.center,
//                             //   height: Get.height * 0.059,
//                             //   width: Get.width * 0.4,
//                             //   decoration: BoxDecoration(
//                             //       color: Color(0xff22B428),
//                             //       borderRadius: BorderRadius.circular(7),
//                             //       boxShadow: [
//                             //         BoxShadow(
//                             //             blurRadius: 0.5,
//                             //             color: Colors.black,
//                             //             spreadRadius: 0.1),
//                             //       ]),
//                             //   child: Text(
//                             //     "Accept",
//                             //     style: MyTextStyle.roboto().copyWith(
//                             //         color: Colors.white,
//                             //         fontSize: Get.width * 0.042,
//                             //         fontWeight: FontWeight.bold),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             right: Get.width * 0.035,
//                             left: Get.width * 0.06,
//                             top: Get.height * 0.02),
//                         child: Divider(
//                           thickness: 3.5,
//                           color: Colors.black,
//                           height: 3,
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
