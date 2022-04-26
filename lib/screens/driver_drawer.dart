// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, unused_local_variable

import 'package:driver_app/providers/user_provider.dart';
import 'package:driver_app/screens/HelpAndSupport.dart';
import 'package:driver_app/screens/chat/chat_list.dart';
import 'package:driver_app/screens/level_screens/home_level.dart';
import 'package:driver_app/screens/onBoard.dart';
import 'package:driver_app/screens/orderHistory/orderHistory_screen.dart';
import 'package:driver_app/screens/profile_screen.dart';
import 'package:driver_app/screens/wallet_screen.dart';
import 'package:driver_app/sevices/shared_pref_services.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';
import '../utils/style.dart';
import 'package:get/get.dart';

class DriverDrawer extends StatefulWidget {
  @override
  State<DriverDrawer> createState() => _DriverDrawerState();
}

class _DriverDrawerState extends State<DriverDrawer> {
  // const DriverDrawer({Key key}) : super(key: key);

  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          Container(
            // color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.3,
            // child: Image.asset('asset/profile.png'),
            child: DrawerHeader(
                decoration: BoxDecoration(
                  color: themeColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DriverProfile()));
                                },
                                child: Container(
                                  width: size.width * .18,
                                  height: size.height * .08,
                                  decoration:
                                      userProvider.driverModel!.dp == null
                                          ? BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'asset/profile.png')),
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(30))
                                          : BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  userProvider.driverModel!.dp
                                                      .toString(),
                                                ),
                                              ),
                                              color: Colors.black,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      // " HY! Mr",
                                      userProvider.driverModel!.fullName
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Brand-Bold",
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                    userProvider.driverModel!.level != 0
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .04),
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage:
                                                  AssetImage(verified_driver),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      width: size.width * .3,
                                      height: size.height * .03,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CircleAvatar(
                                                radius: 10,
                                                backgroundColor: purpleColor,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: size.width * .075,
                                                  height: size.height * .075,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: purpleColor,
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: Text(
                                                      userProvider
                                                          .driverModel!.level
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Brand-Bold",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.03)),
                                                )),
                                            Text(
                                                userProvider.driverModel!
                                                            .level ==
                                                        0
                                                    ? "New Driver"
                                                    : userProvider.driverModel!
                                                                .level ==
                                                            1
                                                        ? "Level 1"
                                                        : userProvider
                                                                    .driverModel!
                                                                    .level ==
                                                                2
                                                            ? "Level 2"
                                                            : userProvider
                                                                        .driverModel!
                                                                        .level ==
                                                                    3
                                                                ? "Level 3"
                                                                : " New Driver",
                                                style: TextStyle(
                                                    color: purpleColor,
                                                    fontFamily: "Brand-Bold",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.04)),
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          drawerHeaderItems(context, "0", hoursOnline.tr, time),
                          drawerHeaderItems(
                              context, "0 KM", totalDistance.tr, speed),
                          drawerHeaderItems(
                              context,
                              userProvider.driverModel!.orderCount.toString(),
                              totalJobs.tr,
                              jobs),
                        ],
                      )
                    ],
                  ),
                )
                //   }
                //   return Container(
                //       color: themeColor,
                //       child: SpinKitFadingCircle(
                //         color: white,
                //         size: 30,
                //       ));
                // })
                ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              // drawerItems(context, wallet, myOrders, () {
              //   Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => MyOrderScreen()));
              // }),
              // // drawerItems(home, "All Orders", () => Get.to(()=>AllOrderScreen())),
              // drawerItems(context, bell, newtask, () {
              //   Navigator.of(context).push(
              //       MaterialPageRoute(builder: (context) => NewTaskScreen()));
              // }),
              drawerItems(context, home, hometext.tr, () {
                Navigator.of(context).pop();
              }),
              // drawerItemChat(context, messageimage, chat.tr, () {
              //   Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => ChatList()));
              // }),
              drawerItems(context, wallet, chat.tr, () {
                AppRoutes.push(context, ChatList());
              }),
              drawerItems(context, wallet, myWallet.tr, () {
                AppRoutes.push(context, WalletScreen());
              }),
              drawerItems(context, history, History.tr, () {
                AppRoutes.push(context, orderHistory());
              }),
              drawerItems(context, bell, Notifications.tr, () {}),
              Container(
                // height: MediaQuery.of(context).size.height * 0.07,
                // color: Colors.green,
                width: MediaQuery.of(context).size.width,
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Image.asset(
                        web,
                        height: MediaQuery.of(context).size.height * 0.04,
                        color: drawerIconColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Text(
                        Language.tr,
                        style: MyTextStyle.poppins().copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                  children: <Widget>[
                    ListTile(
                      onTap: () async {
                        Get.updateLocale(Locale('en', 'US'));
                        Navigator.of(context).pop();
                      },
                      title: Text(
                        'English'.tr,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.updateLocale(Locale('mn', 'MN'));
                        Navigator.of(context).pop();
                      },
                      title: Text(
                        'Mongolian'.tr,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              drawerItems(context, 'asset/settings.png', "Help & Support".tr,
                  () {
                AppRoutes.push(context, HelpAndSupport());
              }),
              drawerItems(context, level, LevelInfo.tr, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeLevelScreen(
                          title: userProvider.driverModel!.level.toString(),
                        )));
              }),
              drawerItems(context, logout, "Logout".tr, () {
                AppRoutes.push(context, Intro());
                SharedPrefServices.userLoggedIn(false);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerHeaderItems(
    BuildContext context,
    String text1,
    String text2,
    String image,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(image),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Text(text1,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Brand-Bold",
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.03)),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Text(text2,
            style: TextStyle(
                color: Colors.black26,
                fontFamily: "Brand-Bold",
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.026)),
      ],
    );
  }

  Widget drawerItems(
      BuildContext context, String img, String title, Function() fun) {
    return InkWell(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: Wrap(
          children: [
            Row(
              children: [
                Image.asset(
                  img,
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.08,
                  color: drawerIconColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.07,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItemChat(
      BuildContext context, String img, String title, Function() fun) {
    return InkWell(
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: Wrap(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Image.asset(
                  img,
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.055,
                  color: drawerIconColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
