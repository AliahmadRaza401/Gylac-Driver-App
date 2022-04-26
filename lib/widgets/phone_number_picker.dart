// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
//
// // ignore: must_be_immutable
// class PhoneNumberPicker extends StatefulWidget {
//
//    PhoneNumberPicker({Key key}) : super(key: key);
//
//   @override
//   _PhoneNumberPickerState createState() => _PhoneNumberPickerState();
// }
//
// class _PhoneNumberPickerState extends State<PhoneNumberPicker> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     final local=Local();
//      final requiredValidator = RequiredValidator(errorText: 'required');
//   final TextEditingController controller = TextEditingController();
//   String initialCountry = 'NG';
//
//   PhoneNumber number = PhoneNumber(isoCode: 'NG');
//   String phoneNum;
//
//   void getPhoneNumber(String phoneNumber) async {
//     PhoneNumber number =
//         await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
//
//     setState(() {
//       this.number = number;
//     });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: Get.width,
//         child: Stack(
//           children: [
//             Container(
//               width: Get.width * 0.2,
//               height: Get.height * 0.063,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   border: Border.all(color: Colors.black, width: 2)),
//             ),
//             InternationalPhoneNumberInput(
//               key: Key('phone_number'),
//               textStyle: TextStyle(
//                 fontSize: Get.height * .021,
//                 color: Colors.black,
//               ),
//               inputDecoration: InputDecoration(
//                 enabledBorder:const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius:const BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: themeYellowColor, width: 2),
//                 ),
//                 errorBorder:const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedErrorBorder:const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 isDense: true,
//                 filled: true,
//                 fillColor: Colors.transparent,
//               ),
//               onInputChanged: (PhoneNumber number) {
//                 setState(() {
//                   phoneNum =
//                   // number.isoCode.toString() +
//                       // "," +
//                       number.dialCode.toString() +
//                       // ","
//
//                       number.phoneNumber
//                           .toString()
//                           .replaceAll(number.dialCode, "");
//
//                   print(phoneNum);
//                 phoneNumber=phoneNum;
//                 // local.phonenumber=phoneNum;
//
//                 });
//
//               },
//               onInputValidated: (bool value) {
//                 print(value);
//               },
//               selectorConfig:const SelectorConfig(
//                 selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                 showFlags: false,
//               ),
//               ignoreBlank: false,
//               hintText: "12345678",
//               autoValidateMode: AutovalidateMode.onUserInteraction,
//               selectorTextStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: Get.height * .02,
//               ),
//               initialValue: number,
//               textFieldController: controller,
//               validator: requiredValidator,
//             ),
//           ],
//         ));
//   }
// }
//
//
// class Local{
//
//   String phoneName;
//
//   String get phonenumber {
//     return phoneNumber;
//   }
//
//
//   set phonenumber (String number) {
//     phoneName =number;
//   }
// }