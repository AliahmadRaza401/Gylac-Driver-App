// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:driver_app/providers/auth_provider.dart';
import 'package:driver_app/screens/driver_vehicle_detail.dart';
import 'package:driver_app/sevices/image_piker.dart';
import 'package:driver_app/utils/motion_toast.dart';

import 'package:driver_app/utils/style.dart';
import 'package:driver_app/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({required Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CountryCode countryCode = CountryCode.fromDialCode('+92');
  bool otpSent = false;
  final _formKey = GlobalKey<FormState>();

  late AuthProvider _authProvider;
  File? _image;
  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    bool loading = Provider.of<AuthProvider>(context).loading;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundimage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06,
                        // bottom: MediaQuery.of(context).size.width *0.04
                      ),
                      child: Text(SignUp.tr,
                          style: MyTextStyle.poppins().copyWith(
                              color: themeColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.04),
                      child: Text(pleasesignuptext.tr,
                          style: MyTextStyle.poppins().copyWith(
                              color: themeColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: themeColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.9),
                                        blurRadius: 7,
                                        offset: const Offset(0, 6),
                                      ),
                                    ]),
                              ),
                              _image == null
                                  ? Image.asset(
                                      cameraimage,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width *
                                          0.17,
                                    )
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width *
                                          0.27,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: null /* add child content here */,
                                    ),
                              // Image.file(
                              //     _image!,
                              //     height:
                              //         MediaQuery.of(context).size.height *
                              //             0.12,
                              //     width: MediaQuery.of(context).size.width *
                              //         0.27,
                              //     fit: BoxFit.contain,
                              //   )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.035,
                          ),
                          Text(AddProfilePicture.tr,
                              style: MyTextStyle.poppins().copyWith(
                                  color: themeColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.022,
                      ),
                      child: Text(Fullname.tr,
                          style: MyTextStyle.poppins().copyWith(
                              color: themeColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      controller: _authProvider.nameController,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      validator: _authProvider.requiredValidator,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Poppins',
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height *
                              0.01, // HERE THE IMPORTANT PART
                        ),
                        prefixIcon: Image.asset(
                          profileimage,
                          scale: 2.7,
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
                        hintText: "Your_Name".tr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.53,
              width: MediaQuery.of(context).size.width,
              child: Padding(
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
                        top: MediaQuery.of(context).size.height * 0.00,
                        // bottom: MediaQuery.of(context).size.width *0.04
                      ),
                      child: Text(Email.tr,
                          style: MyTextStyle.poppins().copyWith(
                              color: themeColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    TextFormField(
                        controller: _authProvider.emailController,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress,
                        // textCapitalization: TextCapitalization.words,
                        maxLines: 1,
                        validator: MultiValidator([
                          _authProvider.requiredValidator,
                          _authProvider.emailValidator,
                        ]),
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                0.01, // HERE THE IMPORTANT PART
                          ),
                          prefixIcon: Image.asset(
                            messageimage,
                            scale: 2.7,
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
                          hintText: Your_Email.tr,
                          // labelText:"Your Name"
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        // bottom: MediaQuery.of(context).size.width *0.04
                      ),
                      child: Text(CreateNewPassword.tr,
                          style: MyTextStyle.poppins().copyWith(
                              color: themeColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    TextFormField(
                        controller: _authProvider.passwordController,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        // obscureText: value.passObscure ? false : true,

                        // textCapitalization: TextCapitalization.words,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                        validator: MultiValidator([
                          _authProvider.requiredValidator,
                          _authProvider.passwordValidator,
                        ]),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                0.01, // HERE THE IMPORTANT PART
                          ),
                          // suffixIcon: InkWell(
                          //     onTap: () {
                          //       value.setPassObscure(!passObscure);
                          //     },
                          //     child: value.passObscure
                          //         ? const Icon(Icons.visibility_off)
                          //         : const Icon(Icons.visibility)),
                          prefixIcon: Image.asset(lockimage, scale: 2.7),
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
                          hintText: Your_password.tr,
                          // labelText:"Your Name"
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        // bottom: MediaQuery.of(context).size.width *0.04
                      ),
                      child: Text(Phonenumber.tr,
                          style: MyTextStyle.poppins().copyWith(
                              color: themeColor,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04)),
                    ),
                    TextFormField(
                        controller: _authProvider.phoneNumberController,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                        keyboardType: TextInputType.number,
                        validator: MultiValidator([
                          _authProvider.requiredValidator,
                          MinLengthValidator(10,
                              errorText: 'Enter valid 10 digits number'),
                        ]),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                0.01, // HERE THE IMPORTANT PART
                          ),

                          prefixIcon: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: CountryCodePicker(
                              textOverflow: TextOverflow.visible,
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.003,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              onChanged: (code) {
                                countryCode = code;
                              },
                              initialSelection: countryCode.dialCode,
                              // optional. Shows only country name and flag
                              showCountryOnly: true,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
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
                          hintText: "XXX-XXX-XXX",
                          // labelText:"Your Name"
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.037,
                    ),
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: MaterialButton(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print("Validation not ");
                                    if (_image == null) {
                                      MyMotionToast.warning(
                                          context,
                                          "Image Required".tr,
                                          "Add your Profile image".tr);
                                    } else {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DriverVehicleDetailScreen(
                                                    userImg: _image,
                                                  ))));
                                    }
                                  } else {
                                    print("Validation Okay");

                                    // showBottomSheet(context);
                                    // uploadImageToFirebase();
                                    // await _sendOTP();
                                  }
                                },
                                color: themeColor,
                                child: Text(
                                  VehicleInformation.toUpperCase().tr,
                                  style: MyTextStyle.roboto().copyWith(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openFilePicker() async {
    print("File Picker");
    var image = await pickImageFromGalleryOrCamera(context);
    if (image == null) return;

    // setState(() => _image = image);
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
        _image = croppedFile;
      });
    }
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colorsansparent,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.08),
        ),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Image.asset(otp_popup),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Enter_OTP,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          otpcodesent,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          pleaseentercodebelow,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25),
                      child: PinFieldAutoFill(
                        decoration: const UnderlineDecoration(
                            textStyle: TextStyle(color: Colors.white),
                            colorBuilder: FixedColorBuilder(
                                Color.fromRGBO(255, 255, 255, 1))),
                        // controller: _authProvider.pinCodeController,
                        onCodeChanged: (value) async {
                          Customdialog.showDialog();
                          // await verifySignupOtp(
                          //   context,
                          //   _authProvider.pinCodeController.text,
                          //   _verificationId,
                          // );
                        },
                        codeLength: 6,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => DriverVehicleDetailScreen(
                                  userImg: _image,
                                ))));
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
                            RESEND_OTP,
                            style: TextStyle(
                                color: const Color(0xffFF0500),
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // _sendOTP() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber:
  //         "${countryCode.dialCode}${_authProvider.phoneNumberController.text}",
  //     verificationCompleted: verificationCompleted,
  //     verificationFailed: verificationFailed,
  //     codeSent: codeSent,
  //     codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //   );
  //   setState(() {
  //     otpSent = true;
  //   });
  // }

  // void codeAutoRetrievalTimeout(String verificationId) {
  //   setState(() {
  //     _verificationId = verificationId;
  //     otpSent = true;
  //   });
  // }

  // void codeSent(String verificationId, int a) {
  //   setState(() {
  //     _verificationId = verificationId;
  //     otpSent = true;
  //   });
  //   Customdialog.closeDialog();
  //   showBottomSheet(context);
  // }

  // void verificationFailed(FirebaseAuthException exception) {
  //   setState(() {
  //     otpSent = false;
  //   });
  //   Customdialog.closeDialog();
  // }

  // void verificationCompleted(PhoneAuthCredential credential) async {
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   if (FirebaseAuth.instance.currentUser != null) {
  //     Customdialog.closeDialog();
  //     Get.to(() => const DriverVehicleDetailScreen(),
  //         transition: Transition.leftToRightWithFade);
  //   } else {}
  // }

  // Future verifySignupOtp(BuildContext context, String id, String otp) async {
  //   final AuthCredential credential =
  //       PhoneAuthProvider.credential(verificationId: id, smsCode: otp);
  //   // FirebaseAuth _auth = FirebaseAuth.instance;

  //   await _auth.signInWithCredential(credential).then((user) async {
  //     // User user = FirebaseAuth.instance.currentUser;
  //     Customdialog.closeDialog();
  //     Get.to(() => const DriverVehicleDetailScreen(),
  //         transition: Transition.leftToRightWithFade);
  //   }).onError((error, stackTrace) {
  //     CustomSnackbar.showSnackBar(title: "Error", message: '$error');
  //     Customdialog.closeDialog();
  //   }).catchError((e) async {
  //     CustomSnackbar.showSnackBar(title: "Error", message: '$e');
  //     Customdialog.closeDialog();
  //   });
  // }
}
