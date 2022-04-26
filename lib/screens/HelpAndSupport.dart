import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/screens/driver_drawer.dart';
import 'package:driver_app/utils/color.dart';
import 'package:driver_app/utils/motion_toast.dart';
import 'package:driver_app/widgets/appbar_custome.dart';
import 'package:driver_app/widgets/custom_btn.dart';
import 'package:driver_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

import '../utils/image.dart';
import 'package:get/get.dart';

class HelpAndSupport extends StatefulWidget {
  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  TextEditingController orderText = TextEditingController();
  TextEditingController issueText = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Select your Issue'.tr;

  // List of items in our dropdown menu
  var items = [
    'Select your Issue'.tr,
    'Issue Regarding Product Damage'.tr,
    'Product Misplace'.tr,
    'Late Delivery'.tr,
    'Bad user experience'.tr,
  ];

  bool isLoading = false;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uniqueId = const Uuid().v1();
  //ADDING SUPPORT TO  DB
  addDataToUserDB() async {
    try {
      firebaseFirestore.collection("support").doc(uniqueId).set({
        "uid": _auth.currentUser!.uid,
        "orderId": orderText.text.toString(),
        "issue": dropdownvalue.toString(),
        "message": issueText.text.toString(),
      }).then((data) async {
        setState(() {
          isLoading = false;
          orderText.text = "";
          issueText.text = "";
          dropdownvalue = "Select your Issue";
        });
        MyMotionToast.success(context, "Success", "Report Sent Successfully!");
      }).catchError((err) {
        setState(() {
          isLoading = false;
        });
        MyMotionToast.error(context, "Oops!", err.toString());
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      MyMotionToast.error(context, "Oops!", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Help & Support".tr),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Please How we can help you?'.tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins')),
                const SizedBox(
                  height: 10,
                ),
                 Text('Order ID'.tr,
                    style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Poppins')),
                CustomTextField(
                  hint: "Enter your Order Id here".tr,
                  controller: orderText,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 54,
                  decoration: BoxDecoration(
                    color: orange,
                    border: Border.all(color: const Color(0xFFA8A8A8)),
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 3), color: stroke, blurRadius: 5)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,
                        dropdownColor: orange,
                        // Down Arrow Icon
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                          size: 20,
                        ),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Poppins'),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: SizedBox(
                                width: 220,
                                child: Text(items.tr)),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Text("Report an issue".tr,
                            style: TextStyle(
                                color: orangeDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Poppins')),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: textFieldStroke, width: 1),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 2),
                              color: black.withOpacity(0.25),
                              blurRadius: 5)
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: TextFormField(
                          // minLines: 2,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          controller: issueText,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 14, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            hintText: "Describe your Issue here".tr,
                            contentPadding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              // HERE THE IMPORTANT PART
                              left: 10,
                            ),

                            labelStyle: TextStyle(),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            // labelText:"Your Name"
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                            color: orange,
                          ))
                        : CustomBtn(
                            text: "SUBMIT".tr,
                            bgColor: orange,
                            onTap: () {
                              if (orderText.text.isEmpty) {
                                MyMotionToast.info(context, "Required".tr,
                                    "Please enter orderId");
                              } else if (dropdownvalue == "Select your issue".tr) {
                                MyMotionToast.info(
                                    context, "Required".tr, "Select Your issue".tr);
                              } else if (issueText.text.isEmpty) {
                                MyMotionToast.info(
                                    context, "Required".tr, "Select Enter Mark".tr);
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                addDataToUserDB();
                              }
                            }),
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
