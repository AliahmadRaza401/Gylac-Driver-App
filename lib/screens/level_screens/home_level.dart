// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors
import 'package:get/get.dart';
import 'package:driver_app/widgets/appbar_custome.dart';
import 'package:flutter/material.dart';
import '../../utils/image.dart';
import '../../utils/strings.dart';

class HomeLevelScreen extends StatelessWidget {
  HomeLevelScreen({required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, "Levels".tr),
        body: SingleChildScrollView(
          child: Column(
            children: [
              title == "1"
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.74,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      width: MediaQuery.of(context).size.width *
                                          .78,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(level1_1),
                                              fit: BoxFit.fill)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          CONGRATS.tr,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.023,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Text(
                                          levelonedriverstring.tr,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          LevelOne.tr,
                                          style: TextStyle(
                                              color: Color(0xff00B0B2),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.045,
                                        ),
                                        Image.asset(
                                          level1_2,
                                          scale: 3.5,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    )
                  : title == "2"
                      ? Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.14,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.74,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .78,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(level2_1),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.035,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              CONGRATS.tr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.023,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Text(
                                              leveltwodriverstring.tr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.015,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Text(
                                              LevelTwo.tr,
                                              style: TextStyle(
                                                  color: Color(0xffBE3BFB),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.045,
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
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.14,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.74,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(level_bg_con),
                                        fit: BoxFit.fill)),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Image.asset(level_bg),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.045,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.32,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                level3_1),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.035,
                                                  ),
                                                  Text(
                                                    CONGRATS.tr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.023,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                  ),
                                                  Text(
                                                    levelthreedriverstring.tr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.015,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                  ),
                                                  Text(
                                                    tophighrated.tr,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFF5922),
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.03,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
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
            ],
          ),
        ),
      ),
    );
  }
}
