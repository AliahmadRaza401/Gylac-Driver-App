// ignore_for_file: prefer_const_constructors

import 'package:driver_app/providers/multi_provider.dart';
import 'package:driver_app/screens/splash.dart';
import 'package:driver_app/sevices/fcm_services.dart';
import 'package:driver_app/sevices/trans.dart';
import 'package:driver_app/utils/local_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalNotificationsService.instance.initialize();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  FCMServices.fcmGetTokenandSubscribe('driver');
  fcmListen();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> _messageHandler(RemoteMessage event) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (event.data['id'] == FirebaseAuth.instance.currentUser?.uid) {
    LocalNotificationsService.instance.showNotification(
        title: '${event.notification?.title}',
        body: '${event.notification?.body}');

    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }

  print("Handling a background message: ${event.messageId}");
}

fcmListen() async {
  // var sfID = await AuthServices.getTraderID();
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    if (event.data['id'] == FirebaseAuth.instance.currentUser?.uid ||
        event.data['id'].toString() == "all") {
      LocalNotificationsService.instance.showNotification(
          title: '${event.notification?.title}',
          body: '${event.notification?.body}');

      FirebaseMessaging.onMessageOpenedApp.listen((message) {});
    } else {}
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2220),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () {
        return MultiProvider(
          providers: multiProvider,
          child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              translations: Messages(), // your translations
              locale: const Locale('en', 'US'), // translations will be displayed in that locale
              fallbackLocale: const Locale('en', 'US'), // specify the fallback local
              home: SplashScreen()),
        );
      },
    );
  }
}
