import 'package:driver_app/screens/login.dart';
import 'package:driver_app/screens/sign_up.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:driver_app/utils/color.dart';
import 'package:driver_app/utils/style.dart';
import 'package:driver_app/widgets/custom_btn.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  bool isSelected1 = true;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: orange,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        automaticallyImplyLeading: false,
        backgroundColor: orange,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
           Text('Change App Language'.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (){
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                transitionDuration: Duration(milliseconds: 500),
                barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                barrierColor: Colors.black.withOpacity(0.5),
                pageBuilder: (context, _, __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),

                        child:StatefulBuilder(
                          builder: (BuildContext context,StateSetter setter){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        if(mounted){
                                          setter(() {
                                            isSelected2 = false;
                                            isSelected1 = true;
                                          });
                                          Get.updateLocale(Locale('en', 'US'));
                                        }
                                      },
                                      child: Container(
                                        width:120,

                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color:orange,
                                            border: Border.all(color: stroke, width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:black.withOpacity(0.5),
                                                  offset: Offset(1, 4),
                                                  blurRadius: 4)
                                            ]
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: CustomText(
                                              text: "ENGLISH",
                                              color:isSelected1 == false?white:black,
                                              size: 15,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        if(mounted){
                                          setter(() {
                                            isSelected2 = true;
                                            isSelected1 = false;
                                          });
                                          Get.updateLocale(Locale('mn', 'MN'));
                                        }
                                      },
                                      child: Container(
                                        width:120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color:orange,
                                            border: Border.all(color: stroke, width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:black.withOpacity(0.5),
                                                  offset: Offset(1, 4),
                                                  blurRadius: 4)
                                            ]
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: CustomText(
                                              text: "MONGOLIAN",
                                              color:isSelected2 == false?white:black,
                                              size: 15,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                transitionBuilder: (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    ).drive(Tween<Offset>(
                      begin: Offset(0, -1.0),
                      end: Offset.zero,
                    )),
                    child: child,
                  );
                },
              );

            },
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 3), color: blackLight, blurRadius: 2)
                ],
                border: Border.all(color: stroke.withOpacity(0.3), width: 1),
                color: lightOrange,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.language,
                color: Colors.white,
              ),
            ),
          ),
        ]),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('asset/intro.png'),
                Column(
                  children: [
                    CustomBtn(
                      text: "SIGN IN".tr,
                      onTap: () {
                        AppRoutes.push(context, LoginPage());
                      },
                      bgColor: orange,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "OR".tr,
                      style: MyTextStyle.poppins()
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomBtn(
                        text: "SIGN UP".tr,
                        bgColor: orange,
                        onTap: () {
                          AppRoutes.push(context, SignUpScreen());
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
