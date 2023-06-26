import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:bhaktiyoga_ios/ram/Service/splash_servcies.dart';
import 'package:bhaktiyoga_ios/ram/home/notify.dart';
import 'package:bhaktiyoga_ios/ram/login/google_login.dart';
import 'package:bhaktiyoga_ios/ram/signup/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_animations/im_animations.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/dynamic_links/dynamic_link.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:volume_control/volume_control.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    // DynamicLinkProvider().initDynamicLink();
    VolumeControl.setVolume(0.5);
    // _firebaseMessaging.requestPermission();
    // FirebaseMessaging.instance.getInitialMessage();
    // FirebaseMessaging.onMessage.listen((event) {
    //   LocalNotificationService.display(event);
    // });

    super.initState();
    token();

    // User? user = FirebaseAuth.instance.currentUser;
    // createDatabase();
    _timer = Timer.periodic(Duration(seconds: 100), (Timer t) => values());
    verifyUserDeatils();
    values();
    createCollectionIfNotExists();
    createCollectionIfNotExistsBank();
    getTotalCount();
    _createRows("");

    // Timer.periodic(Duration(seconds: 10), (Timer t) => retrieveLast24HoursCounter());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();

    super.dispose();
  }

  int typedram = 0;
  int typedramtoday = 0;
  int blessingsearnedtoday = 0;
  int verifyDetails = 0;
  String referCode = "";
  double Total_Users = 0;
  double Total_bless = 0;
  late double bar_goal = 123456;
  bool isLoaded = false;
  String percentString = "";
  late String format_bar_goal = "123456";
  late String format_user = "123456";

  @override
  Widget build(BuildContext context) {
    // verifyUserDeatils();
    // values();
    // _createRows("");
    // getTotalCount();
    if (!isLoaded) {
      // Navigator.pushNamed(context, AppRoutes.googlesignin);
      verifyUserDeatils();
      values();
      createCollectionIfNotExists();
      createCollectionIfNotExistsBank();
      getTotalCount();
      _createRows("");
    }
    if (typedram == null) {
      values();
      verifyUserDeatils();
      getTotalCount();
      _createRows("");
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: size.width * 1.2,
          height: size.height * 1.2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getVerticalSize(
                    420.00,
                  ),
                  width: size.width * 1.2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: size.width * 1.2,
                          height: size.height * 0.55,
                          padding: getPadding(
                            left: 62,
                            top: 1,
                            right: 62,
                            bottom: 21,
                          ),
                          decoration: AppDecoration.fillLime900.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderBR37,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ColorSonar(
                                // contentAreaColor: Colors.red,
                                innerWaveColor: Colors.redAccent,
                                middleWaveColor:
                                    Color.fromARGB(255, 255, 121, 111),
                                outerWaveColor:
                                    Color.fromARGB(255, 251, 166, 160),
                                contentAreaRadius: 80.0,
                                waveFall: 30.0,
                                // waveMotion: WaveMotion.synced,
                                duration: Duration(seconds: 6),
                                waveMotionEffect: Curves.easeOutSine,

                                child: CustomImageView(
                                  imagePath: ImageConstant.imgPngegg1,
                                  height: getSize(
                                    223.00,
                                  ),
                                  width: getSize(
                                    253.00,
                                  ),
                                  margin: getMargin(
                                    bottom: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          // height: 180,
                          margin: getMargin(
                            left: 20,
                            right: 20,
                          ),
                          decoration: AppDecoration.fillYellow100.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder24,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 35,
                                ),
                                child: Text(
                                  "You typed",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtLoraRomanSemiBold10.copyWith(
                                    fontSize: 12,
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 10,
                                ),
                                child: Text(
                                  "$typedramtoday",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtLoraRomanSemiBold42.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 2,
                                ),
                                child: Text(
                                  "Ram today",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtLoraRomanSemiBold20.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  353.00,
                                ),
                                margin: getMargin(
                                  top: 20,
                                ),
                                padding: getPadding(
                                  left: 66,
                                  top: 14,
                                  right: 66,
                                  bottom: 14,
                                ),
                                decoration: AppDecoration.fillLime900.copyWith(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(21),
                                        bottomRight: Radius.circular(21))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "$blessingsearnedtoday blessings earned today",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLoraRomanSemiBold16
                                            .copyWith(
                                          height: getVerticalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: getPadding(
                          left: 33,
                          top: 25,
                          right: 30,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.fillYellow100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder14,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 2,
                              ),
                              child: Text(
                                "You typed Ram",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanSemiBold10.copyWith(
                                  fontSize: 13,
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 3,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 5,
                              ),
                              child: Text(
                                "$typedram",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtLoraRomanSemiBold2568.copyWith(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          token();

                          // LocalNotificationService.initialize();
                          // _firebaseMessaging.requestPermission();
                          // FirebaseMessaging.onMessage
                          //     .listen((RemoteMessage message) {
                          //   // Display the notification
                          //   LocalNotificationService.display(message);
                          // });
                          // FirebaseMessaging.instance.getInitialMessage();
                          // FirebaseMessaging.onMessage.listen((event) {
                          //   LocalNotificationService.display(event);
                          // });

                          // sendNotification("hello");
                          // sendPushMessage();
                          // requestPermission();

                          // updateField();
                          // DynamicLinkProvider().initDynamicLink();
                          if (verifyDetails == 0) {
                            Navigator.pushNamed(
                                context, AppRoutes.verifyDetails);
                          } else {
                            Navigator.pushNamed(
                                context, AppRoutes.blessingDetails);
                          }
                        },
                        height: 82,
                        width: 176,
                        text: "Get Paid",
                        margin: getMargin(
                          left: 18,
                        ),
                        variant: ButtonVariant.FillLime900,
                        // padding: ButtonPadding.PaddingT25,
                        fontStyle: ButtonFontStyle.LoraRomanSemiBold2468,
                        suffixWidget: Container(
                          margin: getMargin(
                            left: 10,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgVector,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 20,
                    top: 5,
                    right: 20,
                  ),
                  child: OutlineGradientButton(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        1.00,
                      ),
                      top: getVerticalSize(
                        1.00,
                      ),
                      right: getHorizontalSize(
                        1.00,
                      ),
                      bottom: getVerticalSize(
                        1.00,
                      ),
                    ),
                    strokeWidth: getHorizontalSize(
                      1.00,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(
                        0.06,
                        0,
                      ),
                      end: Alignment(
                        1,
                        0.9,
                      ),
                      colors: [
                        ColorConstant.lime900,
                        ColorConstant.gray900,
                      ],
                    ),
                    corners: Corners(
                      topLeft: Radius.circular(
                        29,
                      ),
                      topRight: Radius.circular(
                        29,
                      ),
                      bottomLeft: Radius.circular(
                        29,
                      ),
                      bottomRight: Radius.circular(
                        29,
                      ),
                    ),
                    child: Container(
                      width: getHorizontalSize(
                        353.00,
                      ),
                      padding: getPadding(
                        all: 5,
                      ),
                      decoration: AppDecoration.outline.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder29,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.chooseGoal);
                            },
                            height: 48,
                            width: 341,
                            text: "Start Typing “RAM”",
                            variant: ButtonVariant.OutlineYellow100,
                            shape: ButtonShape.CircleBorder24,
                            padding: ButtonPadding.PaddingAll11,
                            fontStyle:
                                ButtonFontStyle.LoraRomanSemiBold18Gray900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // alignment: FractionalOffset.bottomCenter,
                  margin: getMargin(
                    left: 20,
                    top: 5,
                    right: 25,
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: 15,
                    bottom: 14,
                  ),
                  decoration: AppDecoration.outlineYellow100b2.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder21,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Ram Navami Goal",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLoraRomanMedium12.copyWith(
                          fontSize: 20,
                          height: getVerticalSize(
                            1.00,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, right: 5.0, top: 15, bottom: 15),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: LinearProgressIndicator(
                                  backgroundColor: ColorConstant.yellow100,
                                  minHeight: 10.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ColorConstant.lime900),
                                  value: bar_goal,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            percentString.length > 4
                                ? (bar_goal * 100).toString().substring(0, 4) +
                                    "%"
                                : "12",
                            // (bar_goal * 100).toString().substring(0, 4) + "%",
                            // "12",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanMedium12.copyWith(
                              fontSize: 13,
                              height: getVerticalSize(
                                1.00,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                // Total_Users.toDouble()
                                //     .toString()
                                //     .replaceAll(".0", ""),
                                format_user,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanMedium12.copyWith(
                                  fontSize: 20,
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Devotess",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLoraRomanMedium12.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 3,
                            color: ColorConstant.limedark,
                          ),
                          Column(
                            children: [
                              Text(
                                // Total_bless.toString().replaceAll(".0", ""),
                                format_bar_goal,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanMedium12.copyWith(
                                  fontSize: 20,
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Completed",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLoraRomanMedium12.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 3,
                            color: ColorConstant.limedark,
                          ),
                          Column(
                            children: [
                              Text(
                                "1,080,000",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanMedium12.copyWith(
                                  fontSize: 20,
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Goal",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLoraRomanMedium12.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  // alignment: FractionalOffset.bottomCenter,
                  margin: getMargin(
                    left: 20,
                    top: 5,
                    right: 25,
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: 15,
                    bottom: 14,
                  ),
                  decoration: AppDecoration.outlineYellow100b2.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder21,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgGlobe,
                        height: getSize(
                          40.00,
                        ),
                        width: getSize(
                          40.00,
                        ),
                        margin: getMargin(
                          top: MediaQuery.of(context).size.height * 0.02,
                          bottom: 25,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 12,
                          top: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Invite friends to get closer",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLoraRomanMedium12.copyWith(
                                height: getVerticalSize(
                                  1.00,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 10,
                              ),
                              child: Text(
                                "to God & get 11 Blessings ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanMedium12.copyWith(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 10,
                              ),
                              child: Text(
                                "for the good Karma.",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanMedium12.copyWith(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          values();
                          DynamicLinkProvider()
                              .shareLink(context, referCode)
                              .then((value) {
                            Share.share(value);
                          });
                        },
                        height: 32,
                        width: 79,
                        text: "Get now",
                        margin: getMargin(
                          left: 10,
                          top: MediaQuery.of(context).size.height * 0.022,
                          bottom: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  void token() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      FirebaseFirestore.instance
          .collection("bless")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({'token': token}, SetOptions(merge: true));
    } catch (e) {
      print('Error updating token: $e');
    }
  }

  sendNotification(String title) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAA8RqRfeg:APA91bF8u7cxrUG6FnVo6u5VaPBDWEfQnXtS7OYFe2lp8QPCQGuY83xciLGJbcfj--kUpw_vfbDc-GNgPmfDU2hYBYwTy4iHRS6VNKJVYoBFCvZgqfIsaQVwP2ICXMjYsTOoMve-8kBc'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': 'You are followed by someone'
                },
                'priority': 'high',
                'data': data,
                'to':
                    'f71uZyUfQf-Fk7L8VQk8E8:APA91bHJidvMsDw8iEF2ITkcmu8jJuGcpL_afvapWx-QzHEl7fbkwq63jNw5mDMkxzkVIm-QwTFA51wTBnYGKinXjhP5_RxD5Y6b_tQltV1LuEWecu34KLdWWUpPBVYyj3D8HcOkmqEp'
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }

  void sendPushMessage() async {
    try {
      await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization':
                'key=AAAA8RqRfeg:APA91bF8u7cxrUG6FnVo6u5VaPBDWEfQnXtS7OYFe2lp8QPCQGuY83xciLGJbcfj--kUpw_vfbDc-GNgPmfDU2hYBYwTy4iHRS6VNKJVYoBFCvZgqfIsaQVwP2ICXMjYsTOoMve-8kBc',
          },
          body: jsonEncode(<String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': "body",
              'title': "title",
            },
            "notification": <String, dynamic>{
              "title": "title",
              'body': "body",
              "android_channel_id": "as"
            },
            "to":
                "d-iJB0f4QBOa7o_XfXy4M-:APA91bHhZsmWNY7AwHNkgjF-BwG8gvzfO_gXS2LeADNOVOfHbhgGTkiBz2uykvJisn6FtC7OMWZTKy3aJeo5sDLY4O6XeuC1eoCMJ9UYcDxupQ2RuRl5IzDgyelb-hH8-6jveaQZVmY1"
          }));
    } catch (e) {}
  }

  Future<void> updateField() async {
    final documentId =
        'your-document-id'; // Replace with the ID of the document you want to update
    final field = 'referCode'; // Replace with the name of the field you want to
    final Random random = Random();
    String id = (random.nextInt(92143543) + 094512343560).toString();
    await FirebaseFirestore.instance
        .collection('bless') // Replace with the name of your collection
        .doc("manavitalia98@gmail.com")
        .update({field: id})
        .then((_) => print('Field updated successfully!'))
        .catchError((error) => print('Error updating field: $error'));
  }
// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Timer _timer;
//   @override
//   void initState() {
//     VolumeControl.setVolume(0.5);
//     super.initState();
//     // User? user = FirebaseAuth.instance.currentUser;
//     // createDatabase();
//     _timer = Timer.periodic(Duration(seconds: 100), (Timer t) => values());

//     verifyUserDeatils();
//     values();
//     createCollectionIfNotExists();
//     createCollectionIfNotExistsBank();

//     // Timer.periodic(Duration(seconds: 10), (Timer t) => retrieveLast24HoursCounter());
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _timer.cancel();

//     super.dispose();
//   }

//   int typedram = 0;
//   int typedramtoday = 0;
//   int blessingsearnedtoday = 0;
//   int verifyDetails = 0;

//   @override
//   Widget build(BuildContext context) {
//     verifyUserDeatils();
//     values();
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: ColorConstant.gray900,
//         body: Container(
//           width: size.width * 1.2,
//           height: double.infinity,
//           // height:,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   height: getVerticalSize(
//                     480,
//                   ),
//                   width: size.width * 1.2,
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           width: size.width * 1.2,
//                           height: size.height * 0.55,
//                           padding: getPadding(
//                             left: 62,
//                             top: 21,
//                             right: 62,
//                             bottom: 21,
//                           ),
//                           decoration: AppDecoration.fillLime900.copyWith(
//                             borderRadius: BorderRadiusStyle.customBorderBR37,
//                           ),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 ColorSonar(
//                                   // contentAreaColor: Colors.red,
//                                   innerWaveColor: Colors.redAccent,
//                                   middleWaveColor:
//                                       Color.fromARGB(255, 255, 121, 111),
//                                   outerWaveColor:
//                                       Color.fromARGB(255, 251, 166, 160),
//                                   contentAreaRadius: 80.0,
//                                   waveFall: 30.0,
//                                   // waveMotion: WaveMotion.synced,
//                                   duration: Duration(seconds: 6),
//                                   waveMotionEffect: Curves.easeOutSine,

//                                   child: Padding(
//                                     padding: const EdgeInsets.only(top: 48.0),
//                                     child: CustomImageView(
//                                       imagePath: ImageConstant.imgPngegg1,
//                                       height: getSize(
//                                         273.00,
//                                       ),
//                                       width: getSize(
//                                         253.00,
//                                       ),
//                                       margin: getMargin(
//                                         bottom: 120,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           margin: getMargin(
//                             left: 20,
//                             right: 20,
//                           ),
//                           decoration: AppDecoration.fillYellow100.copyWith(
//                             borderRadius: BorderRadiusStyle.circleBorder24,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Padding(
//                                 padding: getPadding(
//                                   top: 45,
//                                 ),
//                                 child: Text(
//                                   "You typed",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style:
//                                       AppStyle.txtLoraRomanSemiBold10.copyWith(
//                                     fontSize: 12,
//                                     height: getVerticalSize(
//                                       1.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: getPadding(
//                                   top: 6,
//                                 ),
//                                 child: Text(
//                                   "$typedramtoday",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style:
//                                       AppStyle.txtLoraRomanSemiBold42.copyWith(
//                                     height: getVerticalSize(
//                                       1.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: getPadding(
//                                   top: 2,
//                                 ),
//                                 child: Text(
//                                   "Ram today",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style:
//                                       AppStyle.txtLoraRomanSemiBold20.copyWith(
//                                     height: getVerticalSize(
//                                       1.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: getHorizontalSize(
//                                   353.00,
//                                 ),
//                                 margin: getMargin(
//                                   top: 20,
//                                 ),
//                                 padding: getPadding(
//                                   left: 66,
//                                   top: 14,
//                                   right: 66,
//                                   bottom: 14,
//                                 ),
//                                 decoration: AppDecoration.fillLime900.copyWith(
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(21),
//                                         bottomRight: Radius.circular(21))),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 3,
//                                       ),
//                                       child: Text(
//                                         "$blessingsearnedtoday blessings earned today",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.left,
//                                         style: AppStyle.txtLoraRomanSemiBold16
//                                             .copyWith(
//                                           height: getVerticalSize(
//                                             1.00,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     top: 10,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: getPadding(
//                           left: 33,
//                           top: 24,
//                           right: 33,
//                           bottom: 13,
//                         ),
//                         decoration: AppDecoration.fillYellow100.copyWith(
//                           borderRadius: BorderRadiusStyle.roundedBorder14,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: getPadding(
//                                 top: 3,
//                               ),
//                               child: Text(
//                                 "You typed Ram",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style:
//                                     AppStyle.txtLoraRomanSemiBold1284.copyWith(
//                                   height: getVerticalSize(
//                                     1.00,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 3,
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 top: 1,
//                               ),
//                               child: Text(
//                                 "$typedram",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style:
//                                     AppStyle.txtLoraRomanSemiBold2568.copyWith(
//                                   height: getVerticalSize(
//                                     1.00,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       CustomButton(
//                         onTap: () {
//                           if (verifyDetails == 0) {
//                             Navigator.pushNamed(
//                                 context, AppRoutes.verifyDetails);
//                           } else {
//                             Navigator.pushNamed(
//                                 context, AppRoutes.blessingDetails);
//                           }
//                         },
//                         height: 82,
//                         width: 176,
//                         text: "Get Paid",
//                         margin: getMargin(
//                           left: 18,
//                         ),
//                         variant: ButtonVariant.FillLime900,
//                         // padding: ButtonPadding.PaddingT25,
//                         fontStyle: ButtonFontStyle.LoraRomanSemiBold2468,
//                         suffixWidget: Container(
//                           margin: getMargin(
//                             left: 10,
//                           ),
//                           child: CustomImageView(
//                             svgPath: ImageConstant.imgVector,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     left: 20,
//                     top: 20,
//                     right: 20,
//                   ),
//                   child: OutlineGradientButton(
//                     padding: EdgeInsets.only(
//                       left: getHorizontalSize(
//                         1.00,
//                       ),
//                       top: getVerticalSize(
//                         1.00,
//                       ),
//                       right: getHorizontalSize(
//                         1.00,
//                       ),
//                       bottom: getVerticalSize(
//                         1.00,
//                       ),
//                     ),
//                     strokeWidth: getHorizontalSize(
//                       1.00,
//                     ),
//                     gradient: LinearGradient(
//                       begin: Alignment(
//                         0.06,
//                         0,
//                       ),
//                       end: Alignment(
//                         1,
//                         0.9,
//                       ),
//                       colors: [
//                         ColorConstant.lime900,
//                         ColorConstant.gray900,
//                       ],
//                     ),
//                     corners: Corners(
//                       topLeft: Radius.circular(
//                         29,
//                       ),
//                       topRight: Radius.circular(
//                         29,
//                       ),
//                       bottomLeft: Radius.circular(
//                         29,
//                       ),
//                       bottomRight: Radius.circular(
//                         29,
//                       ),
//                     ),
//                     child: Container(
//                       width: getHorizontalSize(
//                         353.00,
//                       ),
//                       padding: getPadding(
//                         all: 5,
//                       ),
//                       decoration: AppDecoration.outline.copyWith(
//                         borderRadius: BorderRadiusStyle.circleBorder29,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CustomButton(
//                             onTap: () {
//                               Navigator.pushNamed(
//                                   context, AppRoutes.chooseGoal);
//                             },
//                             height: 48,
//                             width: 341,
//                             text: "Start Typing “RAM”",
//                             variant: ButtonVariant.OutlineYellow100,
//                             shape: ButtonShape.CircleBorder24,
//                             padding: ButtonPadding.PaddingAll11,
//                             fontStyle:
//                                 ButtonFontStyle.LoraRomanSemiBold18Gray900,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: getMargin(
//                     left: 20,
//                     top: 20,
//                     right: 25,
//                     bottom: 5,
//                   ),
//                   padding: getPadding(
//                     left: 15,
//                     top: MediaQuery.of(context).size.height * 0.02,
//                     right: 15,
//                     bottom: 14,
//                   ),
//                   decoration: AppDecoration.outlineYellow100b2.copyWith(
//                     borderRadius: BorderRadiusStyle.circleBorder21,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomImageView(
//                         svgPath: ImageConstant.imgGlobe,
//                         height: getSize(
//                           40.00,
//                         ),
//                         width: getSize(
//                           40.00,
//                         ),
//                         margin: getMargin(
//                           top: MediaQuery.of(context).size.height * 0.015,
//                           bottom: 3,
//                         ),
//                       ),
//                       Padding(
//                         padding: getPadding(
//                           left: 12,
//                           top: MediaQuery.of(context).size.height * 0.015,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Invite your friend and earn",
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                               style: AppStyle.txtLoraRomanMedium12.copyWith(
//                                 height: getVerticalSize(
//                                   1.00,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 top: 10,
//                               ),
//                               child: Text(
//                                 "10 Blessing",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppStyle.txtLoraRomanMedium18.copyWith(
//                                   height: getVerticalSize(
//                                     1.00,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       CustomButton(
//                         height: 32,
//                         width: 79,
//                         text: "Get now",
//                         margin: getMargin(
//                           left: 10,
//                           top: 5,
//                           bottom: 7,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> createDatabase() async {
    // CollectionReference usersCollection = _firestore.collection("bless");
    // CollectionReference ordersCollection = _firestore.collection("orders");

    // await usersCollection.get().then((querySnapshot) {
    //   if (querySnapshot.docs.isEmpty) {
    //     usersCollection.doc(user!.email).set({
    //       'Total Blessings Earned': 0,
    //       'Blessing Earned Today': 0,
    //       'Blessings in account': 0,
    //       'Typed Ram': 0,
    //       'Typed Ram Today': 0,
    //     });
    //     // usersCollection.doc("user2@email.com").set({
    //     //   "email": "user2@email.com",
    //     //   "name": "User 2",
    //     //   "age": 30,
    //     // });
    //   }
    // });
    await FirebaseFirestore.instance.collection('bless').doc(user!.email).set({
      'Total Blessings Earned': 0,
      'Blessing Earned Today': 0,
      'Blessings in account': 0,
      'Typed Ram': 0,
      'Typed Ram Today': 0,
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createCollectionIfNotExists() async {
    DocumentReference document = firestore.collection("bless").doc(user!.email);
    DocumentSnapshot snapshot = await document.get();
    final Random random = Random();
    String id = (random.nextInt(92143543) + 094512343560).toString();
    if (!snapshot.exists) {
      await firestore.collection("bless").doc(user!.email).set({
        'Total Blessings Earned': 0,
        'Blessing Earned Today': 0,
        'Blessings in account': 0,
        'Typed Ram': 0,
        'Typed Ram Today': 0,
        "referCode": id,
      });
    }
  }

  Future<void> createCollectionIfNotExistsBank() async {
    DocumentReference document =
        firestore.collection("Bank Details").doc(user!.email);
    DocumentSnapshot snapshot = await document.get();

    if (!snapshot.exists) {
      await firestore.collection("Bank Details").doc(user!.email).set({
        'Bank Name': "",
        'IFSC Code': "",
        'Account Number': "",
        'PAN Card Number': "",
        'Confirm Details': 0,
      });
    }
  }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference documentReference =
          firestore.collection("bless").doc(user.email);
      documentReference.get().then((DocumentSnapshot snapshot) {
        int currentValue = (snapshot.data() as Map)['Typed Ram'];
        int trt = (snapshot.data() as Map)['Typed Ram Today'];
        int bet = (snapshot.data() as Map)['Blessing Earned Today'];
        String ref = (snapshot.data() as Map)['referCode'];

        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore
        setState(() {
          typedram = currentValue;
          typedramtoday = trt;
          blessingsearnedtoday = bet;
          referCode = ref;
        });
      });
    }
  }

  Future<List<DataRow>> _createRows(String? searchQuery) async {
    List<DataRow> rows = [];

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Users').get();
      snapshot.docs.forEach((doc) {
        if (searchQuery == null ||
            searchQuery.isEmpty ||
            doc.get('Email').toString().contains(searchQuery) ||
            doc.get('Fullname').toString().contains(searchQuery)) {
          rows.add(DataRow(cells: [
            DataCell(Text(doc.get('Email'))),
          ]));
        }
      });
    } catch (e) {
      print(e.toString());
    }

    print('Number of rows: ${rows.length}');
    setState(() {
      Total_Users = rows.length.toDouble();
      var formatter = NumberFormat('#,##,000');
      format_user = formatter.format(Total_Users);
      isLoaded = true;
    });
    print(Total_Users);
    return rows;
  }

  void getTotalCount() {
    FirebaseFirestore.instance
        .collection('bless')
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      num totalCount = 0;
      for (final doc in snapshot.docs) {
        if (doc.data().containsKey('Total Blessings Earned')) {
          totalCount += doc.data()['Total Blessings Earned'];
          print("hello $totalCount");
        }
      }
      setState(() {
        Total_bless = totalCount.toDouble();
        bar_goal = (totalCount / 1080000);
        percentString = bar_goal.toString();
        var formatter = NumberFormat('#,##,000');
        format_bar_goal = formatter.format(Total_bless);
        isLoaded = true;
      });
    });
  }

  void verifyUserDeatils() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        int vd = (snapshot.data() as Map)['Verify Details'];
        setState(() {
          verifyDetails = vd;
        });
      });
    }
  }
}
