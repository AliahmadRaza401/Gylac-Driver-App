// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, unnecessary_string_interpolations

import 'dart:io';
import 'package:driver_app/screens/login.dart';
import 'package:driver_app/sevices/auth_services.dart';
import 'package:driver_app/sevices/image_piker.dart';
import 'package:driver_app/utils/motion_toast.dart';
import 'package:driver_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/style.dart';
import 'package:get/get.dart';

class DriverVehicleDetailScreen extends StatefulWidget {
  File? userImg;
  DriverVehicleDetailScreen({required this.userImg});

  @override
  _DriverVehicleDetailScreenState createState() =>
      _DriverVehicleDetailScreenState();
}

class _DriverVehicleDetailScreenState extends State<DriverVehicleDetailScreen> {
  File? vehiImage;
  final _formKey = GlobalKey<FormState>();

  late AuthProvider _authProvider;
  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    bool loading = Provider.of<AuthProvider>(context).loading;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.21,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.012,
                        ),
                        Center(
                          child: Text("Enter your Vehicle Information".tr,
                              style: MyTextStyle.poppins().copyWith(
                                  color: themeColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.054)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            openFilePicker();
                          },
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.27,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: themeColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.9),
                                            // spreadRadius: 5,
                                            blurRadius: 7,

                                            offset: const Offset(0, 6),
                                          ),
                                        ]),
                                  ),
                                  vehiImage == null
                                      ? Image.asset(
                                          cameraimage,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.17,
                                        )
                                      : Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.27,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                              image: FileImage(vehiImage!),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child:
                                              null /* add child content here */,
                                        ),
                                ],
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(AddYourvehicle.tr,
                                    style: MyTextStyle.poppins().copyWith(
                                        color: themeColor,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04)),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: MediaQuery.of(context).size.height *0.05,),
                        // SizedBox(height: 70,),
                      ],
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07,
                          right: MediaQuery.of(context).size.width * 0.07,
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              // bottom: MediaQuery.of(context).size.width *0.04
                            ),
                            child: Text(CompanyTitle.tr,
                                style: MyTextStyle.poppins().copyWith(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04)),
                          ),
                          TextFormField(
                            controller: _authProvider.companyController,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            validator: _authProvider.requiredValidator,
                            style: const TextStyle(fontSize: 13),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                top: MediaQuery.of(context).size.height *
                                    0.01, // HERE THE IMPORTANT PART
                              ),

                              labelStyle: const TextStyle(),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: themeColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: themeColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: themeColor),
                              ),
                              hintText: "",
                              // labelText:"Your Name"
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(EngineNumber.tr,
                                style: MyTextStyle.poppins().copyWith(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04)),
                          ),
                          TextFormField(
                              controller: _authProvider.engineController,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              validator: _authProvider.requiredValidator,
                              style: const TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  top: MediaQuery.of(context).size.height *
                                      0.01, // HERE THE IMPORTANT PART
                                ),
                                // prefixIcon: Image.asset(messageimage,scale: 2.5,)
                                // ,
                                labelStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                hintText: "",
                                // labelText:"Your Name"
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              // bottom: MediaQuery.of(context).size.width *0.04
                            ),
                            child: Text(RegistrationNumber.tr,
                                style: MyTextStyle.poppins().copyWith(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04)),
                          ),
                          TextFormField(
                              controller:
                                  _authProvider.registrationNumberController,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              validator: _authProvider.requiredValidator,
                              style: const TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  top: MediaQuery.of(context).size.height *
                                      0.01, // HERE THE IMPORTANT PART
                                ),
                                // prefixIcon: Image.asset(lockimage,scale: 2.5,)
                                // ,
                                labelStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                hintText: "",
                                // labelText:"Your Name"
                              )),

                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              // bottom: MediaQuery.of(context).size.width *0.04
                            ),
                            child: Text(CarDesign.tr,
                                style: MyTextStyle.poppins().copyWith(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04)),
                          ),
                          TextFormField(
                              controller: _authProvider.carDesignController,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              validator: _authProvider.requiredValidator,
                              style: const TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  top: MediaQuery.of(context).size.height *
                                      0.01, // HERE THE IMPORTANT PART
                                ),
                                // prefixIcon: Image.asset(profileimage,scale: 2.5,)
                                // ,
                                labelStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                hintText: "",
                                // labelText:"Your Name"
                              )),
                          // SizedBox(height: MediaQuery.of(context).size.height *0.02,),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              // bottom: MediaQuery.of(context).size.width *0.04
                            ),
                            child: Text(ChassisNumber.tr,
                                style: MyTextStyle.poppins().copyWith(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04)),
                          ),
                          TextFormField(
                              controller: _authProvider.chassisNumberController,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              validator: _authProvider.requiredValidator,
                              style: const TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  top: MediaQuery.of(context).size.height *
                                      0.01, // HERE THE IMPORTANT PART
                                ),
                                // prefixIcon: Image.asset(profileimage,scale: 2.5,)
                                // ,
                                labelStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                hintText: "",
                                // labelText:"Your Name"
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),

                          loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: themeColor,
                                ))
                              : Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: MaterialButton(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          print("Validate");
                                          if (vehiImage == null) {
                                            MyMotionToast.warning(
                                                context,
                                                "Image Required".tr,
                                                "Add your Vehicle image".tr);
                                          } else {
                                            print("not Validate");
                                            await AuthServices.signUp(
                                                context,
                                                _authProvider
                                                    .nameController.text,
                                                _authProvider
                                                    .emailController.text,
                                                _authProvider
                                                    .passwordController.text,
                                                _authProvider
                                                    .phoneNumberController.text,
                                                widget.userImg,
                                                vehiImage,
                                                _authProvider
                                                    .companyController.text,
                                                _authProvider
                                                    .engineController.text,
                                                _authProvider
                                                    .registrationNumberController
                                                    .text,
                                                _authProvider
                                                    .carDesignController.text,
                                                _authProvider
                                                    .chassisNumberController
                                                    .text);
                                          }
                                        }
                                      },
                                      color: themeColor,
                                      child: Text(
                                        SignUp.toUpperCase().tr,
                                        style: MyTextStyle.roboto().copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                    ),
                                  ),
                                ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Alreadyhaveanaccount.tr,
                                  style: MyTextStyle.poppins().copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(login.tr,
                                      style: MyTextStyle.poppins().copyWith(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035
                                          // fontWeight: FontWeight.bold
                                          )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget show() {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.contain, image: AssetImage('images/Rectangle.png')),
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.08),
        color: Colorsansparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(signup_popup),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(ifyouwanttoworkasdriver.tr,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text(yourhavetocometooffice.tr,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text(partnercontract.tr,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(soonyourrecivemail.tr,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text(withdetails.tr,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.022,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.32,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.01)),
            child: Center(
              child: Text(
                okay.toUpperCase().tr,
                style: TextStyle(
                    color: const Color(0xffFF0500),
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future uploadImageToFirebase() async {
  //   File fileName = _authProvider.imageLinkVehicle;
  //   var uuid = const Uuid();
  //   firebase_storage.Reference firebaseStorageRef = firebase_storage
  //       .FirebaseStorage.instance
  //       .ref()
  //       .child('Upload_manager/images+${uuid.v4()}');
  //   firebase_storage.UploadTask uploadTask =
  //       firebaseStorageRef.putFile(fileName);
  //   firebase_storage.TaskSnapshot taskSnapshot =
  //       await uploadTask.whenComplete(() async {
  //     String img = await uploadTask.snapshot.ref.getDownloadURL();

  //     setState(() {
  //       _authProvider.imageURLVehicle = img;
  //     });
  //     AuthServices.signUp(
  //       context,
  //       _authProvider.emailController.text,
  //       _authProvider.passwordController.text,
  //       _authProvider.nameController.text,
  //       _authProvider.phoneNumberController.text,
  //       _authProvider.imageURLSignUp,
  //       _authProvider.companyController.text,
  //       _authProvider.engineController.text,
  //       _authProvider.registrationNumberController.text,
  //       _authProvider.carDesignController.text,
  //       _authProvider.chassisNumberController.text,
  //       _authProvider.imageURLVehicle,
  //     );
  //   });
  // }

  Future<void> openFilePicker() async {
    print("File Picker");
    var image = await pickImageFromGalleryOrCamera(context);
    if (image == null) return;

    // setState(() => vehiImage = image);
    cropImage(image);
  }

  /// Crop Image
  cropImage(filePath) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: filePath.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        vehiImage = croppedFile;
      });
    }
  }
}

void showBottomSheetForDriver(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colorsansparent,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.08),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage(otp_popup_bg)),
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.08),
            color: Colorsansparent,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.asset(signup_popup),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ifyouwanttoworkasdriver,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Text(
                    yourhavetocometooffice,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Text(
                    partnercontract,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.007,
                  ),
                  Text(
                    soonyourrecivemail,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Text(
                    withdetails,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.32,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.01)),
                  child: Center(
                    child: Text(
                      okay,
                      style: TextStyle(
                          color: const Color(0xffFF0500),
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        );
      });
}
