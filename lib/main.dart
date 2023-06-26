// @dart=2.9
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:bhaktiyoga_ios/ram/home/notify.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhaktiyoga_ios/ram/dynamic_links/dynamic_link.dart';

import 'package:bhaktiyoga_ios/ram/goal/newWrite.dart';
import 'package:bhaktiyoga_ios/routes/app_routes.dart';

User user = FirebaseAuth.instance.currentUser;
// // Future<void> startTimer() async {
// //   const fiveMinutes = Duration(hours: 24);
// //   Timer.periodic(fiveMinutes, (timer) async {
// //     // Get a reference to the document
// //     final docRef = FirebaseFirestore.instance.collection('bless').doc(user!.email);

// //     // Update the document with the new value
// //     await docRef.update({ 'Typed Ram Today': 0 });
// //   });
// // }

Timer _timer;
void startTimer() {
  final now = DateTime.now().toUtc().add(Duration(hours: 5, minutes: 30));
  final midnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0, 0, 0)
      .toUtc()
      .add(Duration(hours: 5, minutes: 30));
  final difference = midnight.difference(now);
  _timer = Timer(difference, () async {
    // Get a reference to the document
    final docRef =
        FirebaseFirestore.instance.collection('bless').doc(user.email);

    // Update the document with the new value
    await docRef.update({
      'Typed Ram Today': 0,
      'Blessing Earned Today': 0,
    });
    startTimer();
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  /// On click listner
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // MobileAds.instance.initialize();

  //  FirebaseAuth.instance.signInAnonymously();
  await Firebase.initializeApp();
  // DynamicLinkProvider().initDynamicLink();
  Admob.initialize();
  LocalNotificationService.initialize();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  requestPermission();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    startTimer();
    runApp(MyApp());
    // runApp(
    //   DevicePreview(
    //     enabled: true,
    //     tools: [
    //       ...DevicePreview.defaultTools,
    //       // const CustomPlugin(),
    //     ],
    //     builder: (context) => MyApp(),
    //   ),
    // );
  });
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     tools: [
  //       ...DevicePreview.defaultTools,
  //       // const CustomPlugin(),
  //     ],
  //     builder: (context) => MyApp(),
  //   ),
  // );
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   // SystemChrome.setPreferredOrientations([
//   //   DeviceOrientation.portraitUp,
//   // ]).then((_) {
//   // startTimer();
//   runApp(MyApp());
// //   });
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'bhaktiyoga_ios',
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      // home: newWrite(),
    );
  }
}

void requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  }
}


/*
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
  }
} */

//textformfield

// TextFormField(
//  controller: frameThirtyThreeController,
//  keyboardType: TextInputType.name,
//  textCapitalization: TextCapitalization.words,
//  textInputAction: TextInputAction.next,
//  decoration:InputDecoration(labelText: 'Student Name'),),


