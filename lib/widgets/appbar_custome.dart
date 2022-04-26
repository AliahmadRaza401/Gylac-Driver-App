import 'package:driver_app/utils/app_route.dart';
import 'package:driver_app/utils/color.dart';
import 'package:driver_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// class AppBarCustom extends StatelessWidget {
//    const AppBarCustom({Key key,this.title,this.img}) : super(key: key);
//    final String title;
//    final String img;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 3,
//       backgroundColor: const Color(0xffFBB03B),
//       title:  Text(title,
//         style:const TextStyle(
//             fontWeight: FontWeight.bold
//         ),),
//       leading: Image.asset(img,scale: 3,),
//     );
//   }
// }

AppBar appBarCustom(String title) {
  return AppBar(
    backgroundColor: themeColor,
    centerTitle: true,
    toolbarHeight: 185.h,
    leading: GestureDetector(
      onTap: () => scaffoldState.currentState!.openDrawer(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 20.h,
          width: 50.w,
          decoration: BoxDecoration(
              // color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(
            'asset/appMenu.png',
          ))),
        ),
      ),
    ),
    title: Text(title),
  );
}

AppBar customAppBar(BuildContext context, title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 190.h,
    flexibleSpace: Column(
      children: [
        Container(
         // height: 190.h,
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22.r),
                bottomRight: Radius.circular(22.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(0.0, 4.0), //(x,y)
                blurRadius: 10.0.r,
                spreadRadius: 5.r,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          AppRoutes.pop(context);
                          // scaffoldState.currentState!.openDrawer();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            'asset/appMenu.png',
                            height: 70.h,
                          ),
                        ),
                      ),

                      Text(title.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Ubuntu')),
                      SizedBox(
                        width: 40,
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.notifications,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
