// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors, sized_box_for_whitespace

import 'dart:io';
import 'package:driver_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';
import '../utils/style.dart';
import 'package:get/get.dart';


class DriverProfile extends StatefulWidget {
  // const DriverProfile({Key key}) : super(key: key);

  @override
  _DriverProfileState createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  var starrating = 0.0;
  // User user = FirebaseAuth.instance.currentUser;
 late IconData _selectedIcon;

 late File imageLink;

  //late String _verificationId;
  String countryCode='';
  double _userRating = 5.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;
  bool updateData = false;
  String imageUrl = '';
  var locationmessage = "";
  var lattitude;
  var longitute;
  var currentAddress = "";

  String name = "";
  String phone = "";
  String address = "";

  //late bool otpSent;

  TextEditingController pincodeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  //late File imageLink;

  //late String pinCode;

  // getCurrentLocation() async {
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   var lastPosition = await Geolocator.getLastKnownPosition();

  //   lattitude = position.latitude;
  //   longitute = position.longitude;

  //   try {
  //     List<Placemark> placeMark =
  //         await placemarkFromCoordinates(lattitude, longitute);
  //     Placemark place = placeMark.first;
  //     setState(() {
  //       locationmessage = "latitude:" +
  //           lattitude.toString() +
  //           " longitude:" +
  //           longitute.toString();
  //       currentAddress = "${place.locality},${place.street},${place.country}";
  //     });
  //     return currentAddress;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    // getCurrentLocation().then((value) {
    //   print(value);
    //   FirebaseFirestore.instance.collection("users").doc(user.uid).update({
    //     'address': value,
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: themeColor,
          automaticallyImplyLeading: false, // hides leading widget
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                 Navigator.of(context).pop();
                },
                child: Container(
                  width: size.width * .09,
                  height: size.height * .033,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage(back), fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                width: size.width * .15,
              ),
              Text(
                PROFILE.tr,
                style: TextStyle(
                    fontSize: size.height * .027, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  // await FirebaseAuth.instance
                  //     .signOut()
                  //     .then((value) => 
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));

                      // );
                },
                child: Container(
                  width: size.width * .12,
                  height: size.height * .04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage(logoutWhite), fit: BoxFit.contain)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: 
      // FutureBuilder<DocumentSnapshot>(
      //     future: FirebaseFirestore.instance
      //         .collection("users")
      //         .doc(user.uid)
      //         .get(),
      //     builder: (BuildContext context, snapshot) {
      //       if (snapshot.hasData) {
      //         DocumentSnapshot ds = snapshot.data;
      //         return
               SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Stack(
                      // alignment: Alignment.topRight,
                      children: [
                        Container(
                          // alignment: Alignment.center,
                          width: size.width * .46,
                          height: size.height * .28,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage(profileimage1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.072,
                              vertical: MediaQuery.of(context).size.height * 0.057),
                          child: InkWell(
                              onTap: updateData == false
                                  ? null
                                  : () {
                                      showImagePicker(context);
                                    },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage('https://cdn3.vectorstock.com/i/1000x1000/30/97/flat-business-man-user-profile-avatar-icon-vector-4333097.jpg'),
                                backgroundColor: Colors.white,
                                radius: 63,
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              updateData = !updateData;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.5,
                              top: MediaQuery.of(context).size.height * 0.04,
                            ),
                            child: Container(
                              width: size.width * .4,
                              height: size.height * .06,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(editImge)),
                              ),
                              // child:Image.asset(profilePic)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.45,
                            top: MediaQuery.of(context).size.height * 0.08,
                          ),
                          child: Container(
                            width: size.width * .4,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage(verifiedcontainer),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  verified,
                                  scale: 3,
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 20,
                                  child: Text(
                                    VerifiedDriver.tr,
                                    style: MyTextStyle.poppinsBold().copyWith(
                                        fontSize: MediaQuery.of(context).size.height * 0.015,
                                        color: themeColor),
                                  ),
                                )
                              ],
                            ),
                            // child:Image.asset(profilePic)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.45,
                            top: MediaQuery.of(context).size.height * 0.13,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.07,
                                left: MediaQuery.of(context).size.width * 0.015),
                            // alignment: Alignment.center,
                            width: size.width * .4,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                image: DecorationImage(
                                    image: AssetImage(level2container))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  level2,
                                  scale: 3,
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 20,
                                  child: Text(
                                    LevelTwo.tr,
                                    style: MyTextStyle.poppinsBold().copyWith(
                                        fontSize: MediaQuery.of(context).size.height * 0.015,
                                        color: Color(0xffBE3BFB)),
                                  ),
                                )
                              ],
                            ),
                            // child:Image.asset(profilePic)
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: 5,
                        child: Container(
                          width: size.width,
                          height:
                              updateData ? size.height * .55 : size.height * .5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.5, 0.5),
                                    color: themeColor,
                                    blurRadius: 10,
                                    spreadRadius: 0.1),
                                const BoxShadow(
                                    offset: Offset(-0.5, -0.5),
                                    color: Colors.orangeAccent,
                                    blurRadius: 10,
                                    spreadRadius: 0.1)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    // bottom: MediaQuery.of(context).size.width *0.04
                                  ),
                                  child: Text(Fullname.tr,
                                      style: MyTextStyle.poppins().copyWith(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width * 0.045)),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                      // initialValue: "${ds['name']}",
                                      enabled:
                                          updateData == false ? false : true,
                                      // controller: controller.name,
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height *
                                              0.01, // HERE THE IMPORTANT PART
                                        ),
                                        prefixIcon: Image.asset(profileimage,
                                            scale: 2.7),
                                        // enabled: false,
                                        labelStyle: TextStyle(),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        // labelText:"Your Name"
                                      )),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.00,
                                    // bottom: MediaQuery.of(context).size.width *0.04
                                  ),
                                  child: Text(Email.tr,
                                      style: MyTextStyle.poppins().copyWith(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width * 0.045)),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                      // initialValue: "${ds['email']}",
                                      enabled: false,
                                      // controller: controller.email,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 13),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height *
                                              0.01, // HERE THE IMPORTANT PART
                                        ),
                                        prefixIcon: Image.asset(
                                          messageimage,
                                          scale: 2.7,
                                        ),
                                        labelStyle: TextStyle(),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        // enabled: false,
                                        // labelText:"Your Name"
                                      )),
                                ),
                                SizedBox(
                                  height: size.height * .0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    // bottom: MediaQuery.of(context).size.width *0.04
                                  ),
                                  child: Text(PhoneNumber.tr,
                                      style: MyTextStyle.poppins().copyWith(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width * 0.045)),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                      // initialValue: "${ds['phoneNumber']}",
                                      enabled:
                                          updateData == false ? false : true,
                                      // enabled: false,
                                      // controller: controller.phoneNumber,
                                      onChanged: (value) {
                                        setState(() {
                                          phone = value;
                                        });
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 13),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height *
                                              0.01, // HERE THE IMPORTANT PART
                                        ),
                                        prefixIcon: SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.03,
                                          child: Icon(Icons.phone),
                                        ),
                                        labelStyle: TextStyle(),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        // labelText:"Your Name"
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    // bottom: MediaQuery.of(context).size.width *0.04
                                  ),
                                  child: Text(Address.tr,
                                      style: MyTextStyle.poppins().copyWith(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width * 0.045)),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    initialValue: currentAddress,
                                      onChanged: (value) {
                                        setState(() {
                                          address = value;
                                        });
                                      },
                                      // enabled: false,
                                      enabled:
                                          updateData == false ? false : true,
                                      // controller: contro ller.password,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      maxLines: 12,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height *
                                              0.01, // HERE THE IMPORTANT PART
                                        ),
                                        // prefixIcon: Icon(Icons.add,color: Colors.white,),
                                        labelStyle: TextStyle(),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: themeColor),
                                        ),
                                        // labelText:"Your Name"
                                      )),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Visibility(
                                  visible: updateData,
                                  child: Center(
                                    child: MaterialButton(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      onPressed: () async {
                                        Future.value(false);
                                        // Customdialog.showDialog();
                                        // await uploadImageToFirebase();
                                        // FirebasedataUpdate().updateprofile(
                                        //   imageLink: imageUrl,
                                        //   name: name,
                                        //   phoneNumber: phoneim(),
                                        //   address: addressim(),
                                        // );
                                      },
                                      color: themeColor,
                                      child: Text(
                                        Update.toUpperCase().tr,
                                        style: MyTextStyle.roboto().copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context).size.width * 0.05),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .0),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          RatingBarIndicator(
                            rating: _userRating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: MediaQuery.of(context).size.height * 0.03,
                            unratedColor: Colors.amber.withAlpha(50),
                            direction:
                                _isVertical ? Axis.vertical : Axis.horizontal,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.013,
                          ),
                          Text(
                            _userRating.toString(),
                            style: MyTextStyle.poppinsBold().copyWith(
                                color: themeColor,
                                fontSize: MediaQuery.of(context).size.height * 0.021),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(reviewCon)),
                              ),
                              child: Center(
                                  child: Text(
                                Reviews50.tr,
                                style: MyTextStyle.poppinsBold()
                                    .copyWith(color: themeColor),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.015,
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.grey,
                                  ),
                                  title: Text(FAZSAM),
                                  subtitle: Text(
                                      ontimedelivery),
                                  trailing: Container(
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    width: MediaQuery.of(context).size.width * 0.15,
                                    // color:Colors.red,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '11/06/2021',
                                          style: MyTextStyle.poppins().copyWith(
                                              color: Colors.grey,
                                              fontSize: MediaQuery.of(context).size.width * .025),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: themeColor,
                                            ),
                                            Text(_userRating.toString(),
                                                style: MyTextStyle.poppins())
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.015,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Divider(
                                    thickness: 1,
                                    color: themeColor,
                                  ),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              )
            // }
          //   return Loading();
          // }),
    );
  }

  profileBottomSheet(BuildContext context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.08),
        ),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(
                //   color: Color(0xffFBB03B)
                // ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(MediaQuery.of(context).size.height * 0.08),
                  topLeft: Radius.circular(MediaQuery.of(context).size.height * 0.08),
                )),
            child: Column(
              children: [
                SizedBox(height: size.height * .08),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: size.width,
                    height: size.height * .075,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: themeColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: 'Hinthere',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: size.width,
                    height: size.height * .075,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: themeColor,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Hint here",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: size.width,
                    height: size.height * .075,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffFBB03B),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Hint here",
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: size.height * .09,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(btn))),
                  child: Text(
                    Update.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * .025),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showImagePicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(
                      Photolibrary,
                      // 'Гэрэл зургийн номын сан'
                    ),
                    onTap: () {
                      getImageGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: Text(
                    Camera,
                    // 'Камер'
                  ),
                  onTap: () {
                    getImageCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  void getImageGallery() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      imageLink = File(image!.path);
    });
  }

  void getImageCamera() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    setState(() {
      imageLink = File(image!.path);
    });
  }

  // Future uploadImageToFirebase() async {
  //   File fileName = imageLink;
  //   var uuid = const Uuid();
  //   firebase_storage.Reference firebaseStorageRef = firebase_storage
  //       .FirebaseStorage.instance
  //       .ref()
  //       .child('profile_images/images+${uuid.v4()}');
  //   firebase_storage.UploadTask uploadTask =
  //       firebaseStorageRef.putFile(fileName);
  //   firebase_storage.TaskSnapshot taskSnapshot =
  //       await uploadTask.whenComplete(() async {
  //     print(fileName);
  //     String img = await uploadTask.snapshot.ref.getDownloadURL();

  //     // FirebaseFirestore.instance.collection("reports").doc().set({'imageLink': img});

  //     setState(() {
  //       // WidgetProperties.showToast(
  //       //     S.of(context).image_uploaded_successfully_text, Colors.white, Colors.green);
  //       imageUrl = img;
  //       // CustomSnackbar.showSnackBar(title: "image", message: imageUrl);
  //     });
  //   });
  // }
}
