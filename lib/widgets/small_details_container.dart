import 'package:driver_app/utils/color.dart';
import 'package:flutter/material.dart';

import '../utils/image.dart';
import '../utils/style.dart';


smallDetailsContainer(
  BuildContext context,
    String name,
    String time,
    String address,
    String distance,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.height * 0.007),
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: themeColor, spreadRadius: 1),
                ]),
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      dropdown_ani,
                      scale: 2.2,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.poppins().copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.poppins().copyWith(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.025,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .15,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        time,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.poppins().copyWith(
                          color: themeColor,
                          fontSize: MediaQuery.of(context).size.width * 0.027,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(distance,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.poppins().copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Padding(padding: EdgeInsets.only(left: 7)),
                //         Text(
                //           SentiarParis,
                //           style: MyTextStyle.poppins().copyWith(
                //             color: Colors.black,
                //             fontSize: MediaQuery.of(context).size.width * 0.03,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         SizedBox(width: MediaQuery.of(context).size.width * 0.14),
                //
                //       ],
                //     ),
                //     SizedBox(
                //       height: 3,
                //     ),
                //     Row(
                //       children: [
                //
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.1,
                //         ),
                //
                //         ),
                //         SizedBox(
                //           width: MediaQuery.of(context).size.width * .03,
                //         )
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget greenHeading(BuildContext context,title){
    return  Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                top: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              title,
              style: MyTextStyle.poppins().copyWith(
                color: Color(0xff22B428),
                fontSize: MediaQuery.of(context).size.width * 0.036,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }