// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../utils/image.dart';
import '../../utils/strings.dart';

class Level3 extends StatelessWidget {
   Level3({required this.title}) ;
  String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.74,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(level_bg_con), fit: BoxFit.fill)),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(level_bg),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.045,),
                                child: Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.32,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(level3_1),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.035,
                                    ),
                                    Text(
                                      CONGRATS,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context).size.height * 0.023,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.01,
                                    ),
                                    Text(
                                      levelonedriverstring,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context).size.height * 0.015,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.01,
                                    ),
                                    Text(
                                      tophighrated,
                                      style: TextStyle(
                                          // ignore: prefer_const_constructors
                                          color: Color(0xffFF5922),
                                          fontSize: MediaQuery.of(context).size.height * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.02,
                                    ),
                                    Image.asset(
                                      level3_2,
                                      scale: 3.9,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
