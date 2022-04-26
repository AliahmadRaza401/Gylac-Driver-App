
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:driver_app/utils/color.dart';
import 'package:driver_app/utils/style.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
 String title,subtitle,img;
     CustomContainer({
        required this.title, required this.img, required this.subtitle
});

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
      height: MediaQuery.of(context).size.height*0.1,
      width:MediaQuery.of(context).size.width*0.92 ,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: themeColor),
          boxShadow: [
            BoxShadow(
              color: themeColor,
              blurRadius: 2,

            )
          ]
      ),
      child: Row(
        children:  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(widget.img)
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,style: MyTextStyle.poppins().copyWith(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.035,fontWeight: FontWeight.bold,),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.006,
                ),
                Text(widget.subtitle,style: MyTextStyle.poppins().copyWith(color: Color(0xff242A37),fontSize: MediaQuery.of(context).size.width*0.024,),),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
