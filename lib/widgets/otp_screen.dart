// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sheeda_app/ui/auth/sign_up_screen.dart';
// import 'package:sheeda_app/utils/colors.dart';
// import 'package:sheeda_app/utils/fonts.dart';
// import 'package:sheeda_app/utils/sized.dart';
// import 'package:sheeda_app/utils/widgets/custom_dialog.dart';
// import 'package:sms_autofill/sms_autofill.dart';
//
// import '../images.dart';
//
// class Otp extends StatefulWidget {
// String verificationId;
//
//   Otp({@required this.verificationId});
//
//   @override
//   _OtpState createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
//   final _formKey = GlobalKey<FormState>();
//   final pinPutController = TextEditingController();
//   final _pinPutFocusNode = FocusNode();
//   final BoxDecoration pinPutDecoration =const BoxDecoration(
//     color: Colors.white,
//     border: Border(
//         bottom: BorderSide(
//       color: Colors.black,
//     )),
//   );
//   final String phone;
//
//   _OtpState({this.phone});
//   @override
//   void initState() {
//     // Future.delayed(const Duration(seconds: 2), () {
//     //   Get.to(SignUpScreen(), transition: Transition.leftToRightWithFade);
//     // });
//     // listenForCode();
//     // // startTimer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // _timer.cancel();
//     super.dispose();
//   }
//
//   // Timer _timer;
//   int _start;
//   // void startTimer() {
//   //   setState(() {
//   //     _start = 60;
//   //   });
//   //   const oneSec =  Duration(seconds: 1);
//   //   _timer = Timer.periodic(
//   //     oneSec,
//   //     (Timer timer) {
//   //       if (_start == 0) {
//   //         setState(() {
//   //           timer.cancel();
//   //         });
//   //       } else {
//   //         setState(() {
//   //           _start--;
//   //         });
//   //       }
//   //     },
//   //   );
//   // }
//
//   listenForCode() async {
//     // await SmsAutoFill().listenForCode;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           )),
//       child: Form(
//         key: _formKey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: SingleChildScrollView(
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             Padding(
//               padding:const EdgeInsets.only(top: 10, bottom: 10),
//               child: Container(
//                 width: Get.width * 0.2,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(3.0),
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             Image.asset(
//               otpmen,
//               height: Get.height * .12,
//             ),
//             Text(
//               "Enter Otp",
//               style: MyTextStyles.quickSand
//                   .copyWith(color: Colors.black, fontSize: Get.width * 0.05),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Get.width * .1, vertical: Get.height * .01),
//               child:const Text("Enter the OTP received through SMS"),
//             ),
//             Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
//                 child: PinFieldAutoFill(
//                   controller: pinPutController,
//                   enableInteractiveSelection: false,
//                   onCodeChanged: (value) {
//                     // if (value.length == 6) {
//                     //   print("onCodeChanged");
//                     //   var phoneAuthProvider =
//                     //       Provider.of<PhoneAuthenticationProvider>(context,
//                     //           listen: false);
//                     //   phoneAuthProvider.verifyPin(value, context);
//                     // }
//                   },
//                   onCodeSubmitted: (value) {
//                     print("submitted");
//                   },
//                   codeLength: 6,
//                   // controller: _pinPutController,
//                   // focusNode: _pinPutFocusNode,
//                 )),
//             Padding(
//               padding:const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//               child: Row(
//                 children: [
//                   // Text(
//                   //   '00 : ' + '$_start',
//                   // ),
//                   sizedboxw1(),
//                   GestureDetector(
//                     onTap: () async {
//                       // if (_start == 0) {
//                       //   _pinPutController.clear();
//                       //   listenForCode();
//                       //   var phoneAuthProvider =
//                       //       Provider.of<PhoneAuthenticationProvider>(context,
//                       //           listen: false);
//                       //   var signUpProvider =
//                       //       Provider.of<SignUpProvider>(context, listen: false);
//                       //   print(signUpProvider.phoneController.text.toString());
//                       //   phoneAuthProvider.verifyPhone(
//                       //       "+92${signUpProvider.phoneController.text.toString().replaceFirst("0", "")}");
//                       //
//                       // }
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Text(
//                         "Resend OTP",
//                         style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             fontSize: Get.width * .045,
//                             color: _start == 0
//                                 ? Colors.black
//                                 : Colors.grey.withOpacity(.50),
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding:const EdgeInsets.only(bottom: 10),
//               child: Center(
//                   child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(primary: themeYellowColor),
//                 onPressed: () async{
//                   print("processed");
//                   Customdialog.showDialog();
// await varifysignupotp(context,widget.verificationId,pinPutController.text).whenComplete((){
//      Get.to(()=>SignUpScreen(), transition: Transition.leftToRightWithFade);
//      });
//
//                   // var signUpProvider=Provider.of<SignUpProvider>(context,listen: false);
//                   //
//                   // Get.bottomSheet(Message());
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(
//                         vertical: Get.height * 0.017,
//                         horizontal: Get.width * 0.23),
//                     child:const Text("Proceed")),
//               )),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
//     Future varifysignupotp(
//       BuildContext context, String id, String otp, ) async {
//     final AuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: id,
//       smsCode: otp,
//     );
//     FirebaseAuth _auth = FirebaseAuth.instance;
//
//     await _auth.signInWithCredential(credential).then((userp) async{
//
//        setState(() {
//         //  isLogin.setStatus(false);
//         //                   isLogin.islogin=false;
//                           // state=false;
//                         });
//                                       //  Get.offAll(()=>DestinationPage());
//
//
//
//                           }).onError((error, stackTrace){
//    showDialog(context: context, builder: (_)=>AlertDialog(
//         title: Text("${error}"),
//         actions: [
//           TextButton(child: Text("Ok"),onPressed: (){
//             Navigator.pop(context);
//           },)
//         ],
//       ));
//
//
//     }).catchError((e) async {
//       setState(() {
//         //  isLogin.setStatus(false);
//         //                   isLogin.islogin=false;
//                         });
//       // await pr.hide();
//      showDialog(context: context, builder: (_)=>AlertDialog(
//         title: Text("${e}"),
//         actions: [
//           TextButton(child: Text("Ok"),onPressed: (){
//             Navigator.pop(context);
//           },)
//         ],
//       ));
//
//     }
//     );
//       Customdialog.closeDialog();
//
//   }
//
// }
