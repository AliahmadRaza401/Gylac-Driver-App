// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../utils/image.dart';
import '../../utils/strings.dart';

class Level2 extends StatelessWidget {
   Level2({required this.title}) ;
   String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:  Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.74,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    // color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(level_bg_con),
                          fit: BoxFit.fill)),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.asset(level_bg),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width*.78,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(level2_1),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035,
                          ),
                          Column(
                            children: [
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
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                LevelTwo,
                                style: TextStyle(
                                    color: Color(0xffBE3BFB),
                                    fontSize: MediaQuery.of(context).size.height * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.045,
                              ),
                              Image.asset(
                                level2_2,
                                scale: 3.5,
                              )
                            ],
                          )
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
