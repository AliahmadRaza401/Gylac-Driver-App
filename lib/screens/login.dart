import 'package:driver_app/providers/auth_provider.dart';
import 'package:driver_app/screens/sign_up.dart';
import 'package:driver_app/sevices/auth_services.dart';
import 'package:driver_app/utils/app_route.dart';
import 'package:driver_app/utils/motion_toast.dart';
import 'package:driver_app/utils/style.dart';
import 'package:driver_app/widgets/custom_textfield.dart';
import 'package:driver_app/widgets/top_curve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../utils/color.dart';
import '../widgets/custom_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool loading = Provider.of<AuthProvider>(context).loading;

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: SafeArea(

        child:  SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("asset/Frame 32.png"),
              Padding(
                padding: const EdgeInsets.only(left:25.0,right: 25.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05,
                              ),
                              child:  Text("Driver Login".tr,
                                  style: TextStyle(
                                      color: orange,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).size.width * 0.04),
                              child:  Text("Please Login to continue".tr,
                                  style: TextStyle(
                                      color: orange,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            Text("Email".tr,
                                style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Poppins')),
                          ],
                        ),
                        CustomTextField(
                          hint: "Your email".tr,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: lightGrey,
                          ),
                          controller: emailCtl,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            Text("Password".tr,
                                style: TextStyle(
                                    color: orange,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ],
                        ),
                        CustomTextField(
                          hint: "Type a password".tr,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: lightGrey,
                          ),
                          controller: passwordCtl,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text(
                                'Forgot Password?'.tr,
                                style: MyTextStyle.poppins().copyWith(
                                  color: orange,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {

                              },
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              loading
                                  ? const CircularProgressIndicator(
                                color: orange,
                              )
                                  : CustomBtn(
                                text: "LOGIN".tr,
                                onTap: () {
                                  if (emailCtl.text.isEmpty) {
                                    MyMotionToast.error(context,
                                        "Required".tr, "Email is required".tr);
                                  } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(emailCtl.text) ==
                                      false) {
                                    MyMotionToast.error(context, "Error".tr,
                                        "Enter a valid email!".tr);
                                  } else if (passwordCtl.text.isEmpty) {
                                    MyMotionToast.error(
                                        context,
                                        "Required".tr,
                                        "Password is required".tr);
                                  } else if (passwordCtl.text.length <
                                      6) {
                                    MyMotionToast.error(context, "Error".tr,
                                        "Password should be at least six digits.".tr);
                                  } else {
                                    AuthServices.signIn(
                                        context,
                                        emailCtl.text.trim(),
                                        passwordCtl.text.trim( ));
                                  }
                                },
                                bgColor: orange,
                                shadowColor: black,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AppRoutes.push(context, SignUpScreen());
                          },
                          child: SizedBox(
                            // color: Colors.green,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Do not Have an Account? ".tr,
                                  style: MyTextStyle.poppins(),
                                ),
                                Text(
                                  " SIGNUP".tr,
                                  style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






















// // ignore_for_file: deprecated_member_use, prefer_const_constructors

// import 'package:driver_app/providers/auth_provider.dart';
// import 'package:driver_app/screens/sign_up.dart';
// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:provider/provider.dart';

// import '../sevices/auth_services.dart';
// import '../utils/color.dart';
// import '../utils/image.dart';
// import '../utils/strings.dart';
// import '../utils/style.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   // late AuthProvider _authProvider;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _authProvider = Provider.of<AuthProvider>(context);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider _authProvider = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               Container(
//                   height: MediaQuery.of(context).size.height * 0.47,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(backgroundimage),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: MediaQuery.of(context).size.width * 0.07,
//                       right: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: MediaQuery.of(context).size.height * 0.05,
//                           ),
//                           child: Text("$driver  $login",
//                               style: MyTextStyle.poppins().copyWith(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: MediaQuery.of(context).size.width *
//                                       0.06)),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).size.width * 0.04),
//                           child: Text(logintocontinue,
//                               style: MyTextStyle.poppins().copyWith(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: MediaQuery.of(context).size.width *
//                                       0.045)),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.04,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: MediaQuery.of(context).size.height * 0.00,
//                             // bottom: MediaQuery.of(context).size.width *0.04
//                           ),
//                           child: Text(Email,
//                               style: MyTextStyle.poppins().copyWith(
//                                 color: themeColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.04,
//                               )),
//                         ),
//                         TextFormField(
//                           controller: email,
//                           textAlignVertical: TextAlignVertical.center,
//                           textAlign: TextAlign.left,
//                           maxLines: 1,
//                           style: const TextStyle(
//                             fontSize: 13,
//                           ),
//                           validator: MultiValidator([
//                             _authProvider.emailValidator,
//                             _authProvider.requiredValidator,
//                           ]),
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height * 0.01,
//                             ),
//                             prefixIcon: Image.asset(
//                               messageimage,
//                               scale: 2.7,
//                             ),

//                             labelStyle: const TextStyle(),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: themeColor),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: themeColor),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: themeColor),
//                             ),
//                             hintText: youremail,
//                             // labelText:"Your Name"
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.48,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: MediaQuery.of(context).size.width * 0.07,
//                       right: MediaQuery.of(context).size.width * 0.07,
//                       top: MediaQuery.of(context).size.height * 0.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: MediaQuery.of(context).size.height * 0.02,
//                           // bottom: MediaQuery.of(context).size.width *0.04
//                         ),
//                         child: Text(Password,
//                             style: MyTextStyle.poppins().copyWith(
//                                 color: themeColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.04)),
//                       ),
//                       TextFormField(
//                           controller: password,
//                           textAlignVertical: TextAlignVertical.center,
//                           textAlign: TextAlign.left,
//                           maxLines: 1,
//                           style: const TextStyle(
//                             fontSize: 13,
//                           ),
//                           validator: _authProvider.requiredValidator,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.only(
//                               top: MediaQuery.of(context).size.height *
//                                   0.01, // HERE THE IMPORTANT PART
//                             ),
//                             prefixIcon: Image.asset(
//                               lockimage,
//                               scale: 2.7,
//                             ),
//                             labelStyle: const TextStyle(),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: themeColor),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: themeColor),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: themeColor),
//                             ),
//                             hintText: typestrongpassword,
//                             // labelText:"Your Name"
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             top: MediaQuery.of(context).size.height * 0.001,
//                             left: MediaQuery.of(context).size.width * 0.4
//                             // bottom: MediaQuery.of(context).size.width *0.04
//                             ),
//                         child: Text(Forgotpassword,
//                             style: MyTextStyle.poppins().copyWith(
//                                 color: themeColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.04)),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.04,
//                       ),
//                       _authProvider.loading
//                           ? Center(
//                               child: CircularProgressIndicator(
//                               color: themeColor,
//                             ))
//                           : Center(
//                               child: SizedBox(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.07,
//                                 width: MediaQuery.of(context).size.width * 0.5,
//                                 child: MaterialButton(
//                                   elevation: 5,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   onPressed: () async {
//                                     // AppRoutes.push(context, DriverHomeScreen());
//                                     if (_formKey.currentState!.validate()) {
//                                       AuthServices.signIn(
//                                         context,
//                                         email.text.trim(),
//                                         password.text.trim(),
//                                       );
//                                     } else {
//                                       // print("Not Validate");
//                                       // Customdialog.showDialog();
//                                       // userLogin(
//                                       //   email: email.text,
//                                       //   password: password.text,
//                                       // );
//                                       // email.clear();
//                                       // password.clear();
//                                     }
//                                   },
//                                   color: themeColor,
//                                   child: Text(
//                                     login.toUpperCase(),
//                                     style: MyTextStyle.poppins().copyWith(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize:
//                                             MediaQuery.of(context).size.width *
//                                                 0.05),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(donthaveaccount,
//                                 style: MyTextStyle.poppins().copyWith(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * 0.035,
//                                 )),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => SignUpScreen()));
//                               },
//                               child: Text(
//                                 SignUp.toUpperCase(),
//                                 style: MyTextStyle.poppins().copyWith(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * 0.035,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
