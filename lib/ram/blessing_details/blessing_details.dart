import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/profile/user_profile.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_subtitle.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../login/google_login.dart';

class BlessingDetails extends StatefulWidget {
  @override
  State<BlessingDetails> createState() => _BlessingDetailsState();
}

class _BlessingDetailsState extends State<BlessingDetails> {
  late Timer _timer;
  bool _mounted = true;
  int totalblessingsearned = 0;
  int blessingsinaccount = 0;
  int confirmDetails = 0;
  int withdrawStatus = 0;
  String userEmail = "";
  String userFullName = "";
  String userPhone = "";
  String userGender = "";
  String userDOB = "";
  String letterFirstFullName = "";
  String finalStringuserFullName = "";
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    // User? user = FirebaseAuth.instance.currentUser;
    bankConfirmValues();
    values();
    // _timer = Timer.periodic(Duration(seconds: 2), (Timer t) => values());
    // Timer.periodic(Duration(seconds: 10), (Timer t) => retrieveLast24HoursCounter());
  }

  @override
  void dispose() {
    _mounted = false;
    // _timer.cancel();
    // TODO: implement dispose
    // values();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      values();
    }
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        FocusScope.of(context).unfocus();
        return false;
      },
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
                          width: size.width * 1.2,
                          height: size.height * 0.59,
                          padding: getPadding(top: 27, bottom: 27),
                          decoration: AppDecoration.fillLime900.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBR37),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomAppBar(
                                    height: getVerticalSize(56.00),
                                    leadingWidth: 34,
                                    leading: AppbarImage(
                                        height: getVerticalSize(22.00),
                                        width: getHorizontalSize(13.00),
                                        svgPath: ImageConstant.imgArrowleft,
                                        margin: getMargin(left: 21, bottom: 2),
                                        onTap: () => onTapArrowleft2(context)),
                                    centerTitle: true,
                                    title: AppbarSubtitle(text: "My Profile")),
                                Container(
                                    width: getHorizontalSize(120.00),
                                    margin: getMargin(
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.165,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        right:
                                            MediaQuery.of(context).size.height *
                                                0.16),
                                    padding: getPadding(
                                        left: 28,
                                        top: 15,
                                        right: 28,
                                        bottom: 20),
                                    decoration: AppDecoration.fillYellow100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder55),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.035,
                                            ),
                                            child: Text(
                                              letterFirstFullName.toUpperCase(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtLucidaGrandeBold5937
                                                  .copyWith(
                                                height: getVerticalSize(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.001),
                                              ),
                                            ),
                                          ),
                                        ])),
                                Padding(
                                    padding: getPadding(top: 14),
                                    child: Text("$userFullName",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLoraRomanSemiBold28
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.00)))),
                                Padding(
                                    padding: getPadding(top: 6),
                                    child: Text("$userEmail",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLoraRomanSemiBold12
                                            .copyWith(
                                                fontSize: 15,
                                                height: getVerticalSize(1.2)))),
                                Padding(
                                    padding: getPadding(top: 2),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: getPadding(
                                                  left: 26,
                                                  top: 17,
                                                  right: 16,
                                                  bottom: 17),
                                              decoration: AppDecoration
                                                  .fillYellow100
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder14),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 1),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 5,
                                                              right: 20,
                                                              top: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.02),
                                                          child: Text(
                                                              "Total blessing earned",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtLoraRomanSemiBold10
                                                                  .copyWith(
                                                                      fontSize:
                                                                          11,
                                                                      height: getVerticalSize(
                                                                          1.00))),
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          "$totalblessingsearned",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtLoraRomanSemiBold2731
                                                              .copyWith(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1.00))),
                                                    )
                                                  ])),
                                          Container(
                                              margin: getMargin(left: 5),
                                              padding: getPadding(
                                                  left: 25,
                                                  top: 17,
                                                  right: 25,
                                                  bottom: 17),
                                              decoration: AppDecoration
                                                  .fillGray800
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder14),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 1),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              top: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01),
                                                          child: Column(
                                                            children: [
                                                              Text("Blessings in your Account ",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtLoraRomanSemiBold10Yellow100
                                                                      .copyWith(
                                                                          fontSize:
                                                                              10,
                                                                          height:
                                                                              getVerticalSize(1.00))),
                                                              Text(" ",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtLoraRomanSemiBold10Yellow100
                                                                      .copyWith(
                                                                          fontSize:
                                                                              10,
                                                                          height:
                                                                              getVerticalSize(1.00))),
                                                            ],
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          "$blessingsinaccount",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtLoraRomanSemiBold2731Yellow100
                                                              .copyWith(
                                                                  height:
                                                                      getVerticalSize(
                                                                          1.00))),
                                                    )
                                                  ]))
                                        ]))
                              ])),
                      withdrawStatus == 0 && blessingsinaccount < 108
                          ? Container(
                              margin: getMargin(left: 20, top: 28, right: 20),
                              padding: getPadding(
                                  left: 13, top: 14, right: 13, bottom: 14),
                              decoration: AppDecoration.outlineYellow100b22
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder18),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: getMargin(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            bottom: 2),
                                        color: ColorConstant.yellow100,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(16.00))),
                                        child: Container(
                                            height: getSize(33.00),
                                            width: getSize(33.00),
                                            decoration: AppDecoration
                                                .fillYellow100
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder14),
                                            child: Stack(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgClock,
                                                  height: getSize(33.00),
                                                  width: getSize(33.00),
                                                  alignment: Alignment.center)
                                            ]))),
                                    Padding(
                                        padding: getPadding(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "You can convert & withdraw your",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtLoraRomanMedium1086
                                                      .copyWith(
                                                          fontSize: 10,
                                                          height:
                                                              getVerticalSize(
                                                                  1.00))),
                                              Padding(
                                                padding: getPadding(
                                                    top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.01),
                                                child: Text(
                                                  "blessings to your bank account after",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtLoraRomanMedium1086
                                                      .copyWith(
                                                    fontSize: 10,
                                                    height:
                                                        getVerticalSize(1.00),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                    top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.01),
                                                child: Text(
                                                  "reaching the goal of 108 Blessings.",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtLoraRomanMedium1086
                                                      .copyWith(
                                                    fontSize: 10,
                                                    height:
                                                        getVerticalSize(1.00),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                    Spacer(),
                                    CustomButton(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "You Don't Have Enough Blessings");
                                          // if (confirmDetails == 0) {
                                          //   Navigator.pushNamed(
                                          //       context, AppRoutes.bankDetails);
                                          // } else {
                                          //   Navigator.pushNamed(context,
                                          //       AppRoutes.confirmDetails);
                                          // }
                                        },
                                        height: 28,
                                        width: 80,
                                        text: "Withdraw",
                                        margin: getMargin(top: 3, bottom: 4),
                                        variant: ButtonVariant.grey,
                                        shape: ButtonShape.RoundedBorder9,
                                        fontStyle: ButtonFontStyle.darklime)
                                  ]))
                          : withdrawStatus == 0 && blessingsinaccount >= 108
                              ? Container(
                                  margin:
                                      getMargin(left: 20, top: 28, right: 20),
                                  padding: getPadding(
                                      left: 13, top: 14, right: 13, bottom: 14),
                                  decoration: AppDecoration.outlineYellow100b22
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder18),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: getMargin(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                bottom: 2),
                                            color: ColorConstant.yellow100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            16.00))),
                                            child: Container(
                                                height: getSize(33.00),
                                                width: getSize(33.00),
                                                decoration: AppDecoration
                                                    .fillYellow100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder14),
                                                child: Stack(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgClock,
                                                      height: getSize(33.00),
                                                      width: getSize(33.00),
                                                      alignment:
                                                          Alignment.center)
                                                ]))),
                                        Padding(
                                            padding: getPadding(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.005),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "You can convert & withdraw your",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtLoraRomanMedium1086
                                                          .copyWith(
                                                              fontSize: 10,
                                                              height:
                                                                  getVerticalSize(
                                                                      1.00))),
                                                  Padding(
                                                    padding: getPadding(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01),
                                                    child: Text(
                                                      "blessings to your bank account after",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtLoraRomanMedium1086
                                                          .copyWith(
                                                        fontSize: 10,
                                                        height: getVerticalSize(
                                                            1.00),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01),
                                                    child: Text(
                                                      "reaching the goal of 108 Blessings.",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtLoraRomanMedium1086
                                                          .copyWith(
                                                        fontSize: 10,
                                                        height: getVerticalSize(
                                                            1.00),
                                                      ),
                                                    ),
                                                  ),
                                                ])),
                                        Spacer(),
                                        CustomButton(
                                            onTap: () {
                                              if (confirmDetails == 0) {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.bankDetails);
                                              } else {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.confirmDetails);
                                              }
                                            },
                                            height: 28,
                                            width: 80,
                                            text: "Withdraw",
                                            margin:
                                                getMargin(top: 3, bottom: 4),
                                            // variant: ButtonVariant.grey,
                                            shape: ButtonShape.RoundedBorder9,
                                            fontStyle: ButtonFontStyle
                                                .LoraRomanSemiBold1267)
                                      ]))
                              : Container(
                                  margin:
                                      getMargin(left: 20, top: 28, right: 20),
                                  padding: getPadding(
                                      left: 13, top: 14, right: 13, bottom: 14),
                                  decoration: AppDecoration.outlineYellow100b22
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder18),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: getMargin(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                bottom: 2),
                                            color: ColorConstant.yellow100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            16.00))),
                                            child: Container(
                                                height: getSize(33.00),
                                                width: getSize(33.00),
                                                decoration: AppDecoration
                                                    .fillYellow100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder14),
                                                child: Stack(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgClock,
                                                      height: getSize(33.00),
                                                      width: getSize(33.00),
                                                      alignment:
                                                          Alignment.center)
                                                ]))),
                                        Padding(
                                            padding: getPadding(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.015),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Convert 1080 blessings to",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtLoraRomanMedium1086
                                                          .copyWith(
                                                              fontSize: 14,
                                                              height:
                                                                  getVerticalSize(
                                                                      1.00))),
                                                  Padding(
                                                    padding: getPadding(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01),
                                                    child: Text(
                                                      "₹ 1080",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtLoraRomanMedium1086
                                                          .copyWith(
                                                        fontSize: 17,
                                                        height: getVerticalSize(
                                                            1.00),
                                                      ),
                                                    ),
                                                  ),
                                                ])),
                                        Spacer(),
                                        CustomButton(
                                            onTap: () {
                                              if (confirmDetails == 0) {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.bankDetails);
                                              } else {
                                                Navigator.pushNamed(context,
                                                    AppRoutes.confirmDetails);
                                              }
                                            },
                                            height: 28,
                                            width: 80,
                                            text: "Withdraw",
                                            margin:
                                                getMargin(top: 3, bottom: 4),
                                            // variant: ButtonVariant.grey,
                                            shape: ButtonShape.RoundedBorder9,
                                            fontStyle: ButtonFontStyle
                                                .LoraRomanSemiBold1267)
                                      ])),
                      Padding(
                          padding: getPadding(left: 32, top: 25, right: 32),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, AppRoutes.userProfile);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserProfile(
                                            dataa: [
                                              userFullName,
                                              userEmail,
                                              userPhone,
                                              userGender,
                                              userDOB
                                            ],
                                          )));
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Account information",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtLoraRomanSemiBold16
                                          .copyWith(
                                              height: getVerticalSize(1.00))),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgVector,
                                      height: getVerticalSize(10.00),
                                      width: getHorizontalSize(5.00),
                                      margin: getMargin(top: 5, bottom: 5))
                                ]),
                          )),
                      Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 15),
                          decoration:
                              BoxDecoration(color: ColorConstant.yellow10026)),
                      Padding(
                          padding: getPadding(left: 32, top: 15, right: 32),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Bank details and transactions",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLoraRomanSemiBold16
                                        .copyWith(
                                            height: getVerticalSize(1.00))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgVector,
                                    height: getVerticalSize(10.00),
                                    width: getHorizontalSize(5.00),
                                    margin: getMargin(top: 5, bottom: 5))
                              ])),
                      // Container(
                      //     height: getVerticalSize(1.00),
                      //     width: size.width,
                      //     margin: getMargin(top: 15),
                      //     decoration:
                      //         BoxDecoration(color: ColorConstant.yellow10026)),
                      // GestureDetector(
                      //   onTap: () async {
                      //     try {
                      //       User? user = FirebaseAuth.instance.currentUser;
                      //       String? userEmail = user!.email;
                      //       _signOut();
                      //       // Get the document reference for the user's email address
                      //       DocumentReference docRef = FirebaseFirestore
                      //           .instance
                      //           .collection('Users')
                      //           .doc(userEmail);

                      //       DocumentReference docBless = FirebaseFirestore
                      //           .instance
                      //           .collection('bless')
                      //           .doc(userEmail);

                      //       DocumentReference docBank = FirebaseFirestore
                      //           .instance
                      //           .collection('Bank Details')
                      //           .doc(userEmail);

                      //       // Delete the document
                      //       await docRef.delete();
                      //       await docBless.delete();
                      //       await docBank.delete();

                      //       // Delete the user's account

                      //       await user.delete();
                      //       await GoogleSignIn().signOut();

                      //       // User account and associated document deleted successfully
                      //     } catch (e) {
                      //       // Handle the error here
                      //       print(
                      //           'Error deleting user account and associated document: $e');
                      //     }
                      //     Fluttertoast.showToast(msg: "Account Deleted");
                      //     await FirebaseAuth.instance.signOut();

                      //     // Navigate to the login page
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => LoginPage()),
                      //     );
                      //   },
                      //   child: Padding(
                      //       padding: getPadding(left: 32, top: 15, right: 32),
                      //       child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text("Delete Account",
                      //                 overflow: TextOverflow.ellipsis,
                      //                 textAlign: TextAlign.left,
                      //                 style: AppStyle.txtLoraRomanSemiBold16
                      //                     .copyWith(
                      //                         height: getVerticalSize(1.00))),
                      //             CustomImageView(
                      //                 svgPath: ImageConstant.imgVector,
                      //                 height: getVerticalSize(10.00),
                      //                 width: getHorizontalSize(5.00),
                      //                 margin: getMargin(top: 5, bottom: 5))
                      //           ])),
                      // ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 15),
                          decoration:
                              BoxDecoration(color: ColorConstant.yellow10026)),
                      Padding(
                          padding: getPadding(left: 32, top: 15, right: 32),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Notifications",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLoraRomanSemiBold16
                                        .copyWith(
                                            height: getVerticalSize(1.00))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgVector,
                                    height: getVerticalSize(10.00),
                                    width: getHorizontalSize(5.00),
                                    margin: getMargin(top: 5, bottom: 5))
                              ])),
                      Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 15),
                          decoration:
                              BoxDecoration(color: ColorConstant.yellow10026)),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.googlesignin);
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 32, top: 17),
                                child: Text("Logout",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLoraRomanSemiBold16
                                        .copyWith(
                                            height: getVerticalSize(1.00))))),
                      ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 13, bottom: 5),
                          decoration:
                              BoxDecoration(color: ColorConstant.yellow10026))
                    ]),
              ))),
    );
  }

  // void _signOut() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;

  //   try {
  //     // final appleResult = await SignInWithApple.getAppleIDCredential(
  //     //   scopes: [
  //     //     AppleIDAuthorizationScopes.email,
  //     //     AppleIDAuthorizationScopes.fullName,
  //     //   ],
  //     // );
  //     final AuthCredential credential = OAuthProvider('apple.com').credential(
  //       accessToken: '',
  //       idToken: '',
  //     );
  //     await user?.reauthenticateWithCredential(credential);
  //     await user?.unlink(credential.providerId);
  //     await user?.delete();
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

  // void _newsignOut() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;

  //   try {
  //     final appleResult = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     final AuthCredential credential = OAuthProvider('apple.com').credential(
  //       accessToken: '',
  //       idToken: '',
  //     );
  //     await user?.reauthenticateWithCredential(credential);

  //     // Unlink from Apple sign-in provider
  //     String? appleProviderId;
  //     for (UserInfo userInfo in user!.providerData) {
  //       if (userInfo.providerId == 'apple.com') {
  //         appleProviderId = userInfo.providerId;
  //         break;
  //       }
  //     }
  //     if (appleProviderId != null) {
  //       await user.unlink(appleProviderId);
  //     }

  //     // Delete user from Firebase Auth
  //     await user.delete();
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

  onTapArrowleft2(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen)
        .then((value) => setState(() {}));
    FocusScope.of(context).unfocus();
    return false;
  }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference documentReference =
          firestore.collection("bless").doc(user.email);
      documentReference.get().then((DocumentSnapshot snapshot) {
        int tbe = (snapshot.data() as Map)['Total Blessings Earned'];
        int bia = (snapshot.data() as Map)['Blessings in account'];

        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore

        setState(() {
          totalblessingsearned = tbe;
          blessingsinaccount = bia;
          isLoaded = true;
          // typedram=currentValue;
          // typedramtoday=trt;
          // blessingsearnedtoday=bet;
        });
      });

      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        String email = (snapshot.data() as Map)['Email'];
        String fullname = (snapshot.data() as Map)['Fullname'];
        String phone = (snapshot.data() as Map)['Phone'];
        String gender = (snapshot.data() as Map)['Gender'];
        String dob = (snapshot.data() as Map)['DOB'];

        int withdraw = (snapshot.data() as Map)['Withdraw'];

        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore
        if (_mounted) {
          setState(() {
            letterFirstFullName = fullname[0];
            userEmail = email;
            userFullName = fullname;
            userPhone = phone;
            userGender = gender;
            userDOB = dob;
            withdrawStatus = withdraw;

            // subStringuserFullName = fullname.substring(0, 1).toUpperCase();
            // finalStringuserFullName = subStringuserFullName;
            // typedram=currentValue;
            // typedramtoday=trt;
            // blessingsearnedtoday=bet;
          });
        }
      });
    }
  }

  void bankConfirmValues() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref =
          firestore.collection("Bank Details").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        int cD = (snapshot.data() as Map)['Confirm Details'];

        // snapshot.reference.update({
        //   // 'Bank Name': bankNameController.text,
        //   // 'IFSC Code': ifscCodeController.text,
        //   // 'Account Number': accountNumberController.text,
        //   // 'PAN Card Number': panCardController.text,
        //   'Confirm Details': 1,
        // });
        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore
        setState(() {
          confirmDetails = cD;
          // subStringuserFullName = userFullName.substring(0, 1).toUpperCase();

          // typedram=currentValue;
          // typedramtoday=trt;
          // blessingsearnedtoday=bet;
        });
      });
    }
  }
}











// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:bhaktiyoga_ios/core/app_export.dart';
// import 'package:bhaktiyoga_ios/ram/profile/user_profile.dart';
// import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
// import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_subtitle.dart';
// import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
// import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

// class BlessingDetails extends StatefulWidget {
//   @override
//   State<BlessingDetails> createState() => _BlessingDetailsState();
// }

// class _BlessingDetailsState extends State<BlessingDetails> {
//   late Timer _timer;
//   bool _mounted = true;
//   int totalblessingsearned = 0;
//   int blessingsinaccount = 0;
//   int confirmDetails = 0;
//   int withdrawStatus = 0;
//   String userEmail = "";
//   String userFullName = "";
//   String userPhone = "";
//   String userGender = "";
//   String userDOB = "";
//   String letterFirstFullName = "";
//   String finalStringuserFullName = " ";

//   @override
//   void initState() {
//     super.initState();
//     // User? user = FirebaseAuth.instance.currentUser;
//     bankConfirmValues();
//     values();
//     // _timer = Timer.periodic(Duration(seconds: 2), (Timer t) => values());
//     // Timer.periodic(Duration(seconds: 10), (Timer t) => retrieveLast24HoursCounter());
//   }

//   @override
//   void dispose() {
//     _mounted = false;
//     // _timer.cancel();
//     // TODO: implement dispose
//     // values();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     values();
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
//         FocusScope.of(context).unfocus();
//         return false;
//       },
//       child: Scaffold(
//           backgroundColor: ColorConstant.gray900,
//           body: Container(
//               width: size.width * 1.2,
//               height: size.height * 1.2,
//               child: SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                           width: size.width * 1.2,
//                           height: size.height * 0.6,
//                           padding: getPadding(top: 0, bottom: 27),
//                           decoration: AppDecoration.fillLime900.copyWith(
//                               borderRadius: BorderRadiusStyle.customBorderBR37),
//                           child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CustomAppBar(
//                                     height: getVerticalSize(56.00),
//                                     leadingWidth: 34,
//                                     leading: AppbarImage(
//                                         height: getVerticalSize(22.00),
//                                         width: getHorizontalSize(13.00),
//                                         svgPath: ImageConstant.imgArrowleft,
//                                         margin: getMargin(left: 21, bottom: 2),
//                                         onTap: () => onTapArrowleft2(context)),
//                                     centerTitle: true,
//                                     title: AppbarSubtitle(text: "My Profile")),
//                                 Container(
//                                     width: getHorizontalSize(120.00),
//                                     margin: getMargin(
//                                         left:
//                                             MediaQuery.of(context).size.height *
//                                                 0.165,
//                                         top:
//                                             MediaQuery.of(context).size.height *
//                                                 0.04,
//                                         right:
//                                             MediaQuery.of(context).size.height *
//                                                 0.16),
//                                     padding: getPadding(
//                                         left: 28,
//                                         top: 15,
//                                         right: 28,
//                                         bottom: 20),
//                                     decoration: AppDecoration.fillYellow100
//                                         .copyWith(
//                                             borderRadius: BorderRadiusStyle
//                                                 .roundedBorder55),
//                                     child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Padding(
//                                             padding: getPadding(
//                                               top: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.035,
//                                             ),
//                                             child: Text(
//                                               letterFirstFullName.toUpperCase(),
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: AppStyle
//                                                   .txtLucidaGrandeBold5937
//                                                   .copyWith(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.001,
//                                               ),
//                                             ),
//                                           ),
//                                         ])),
//                                 Padding(
//                                     padding: getPadding(top: 14),
//                                     child: Text("$userFullName",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.left,
//                                         style: AppStyle.txtLoraRomanSemiBold28
//                                             .copyWith(
//                                                 height:
//                                                     getVerticalSize(1.00)))),
//                                 Padding(
//                                     padding: getPadding(top: 6),
//                                     child: Text("$userEmail",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.left,
//                                         style: AppStyle.txtLoraRomanSemiBold12
//                                             .copyWith(
//                                                 fontSize: 15,
//                                                 height: getVerticalSize(1.2)))),
//                                 Padding(
//                                     padding: getPadding(top: 19),
//                                     child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Container(
//                                               padding: getPadding(
//                                                   left: 26,
//                                                   top: 17,
//                                                   right: 16,
//                                                   bottom: 17),
//                                               decoration: AppDecoration
//                                                   .fillYellow100
//                                                   .copyWith(
//                                                       borderRadius:
//                                                           BorderRadiusStyle
//                                                               .roundedBorder14),
//                                               child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Padding(
//                                                         padding:
//                                                             getPadding(top: 1),
//                                                         child: Padding(
//                                                           padding: EdgeInsets.only(
//                                                               left: 5,
//                                                               right: 20,
//                                                               top: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .height *
//                                                                   0.02),
//                                                           child: Text(
//                                                               "Total blessing earned",
//                                                               overflow:
//                                                                   TextOverflow
//                                                                       .ellipsis,
//                                                               textAlign:
//                                                                   TextAlign
//                                                                       .left,
//                                                               style: AppStyle
//                                                                   .txtLoraRomanSemiBold10
//                                                                   .copyWith(
//                                                                       fontSize:
//                                                                           11,
//                                                                       height: getVerticalSize(
//                                                                           1.00))),
//                                                         )),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                           "$totalblessingsearned",
//                                                           overflow: TextOverflow
//                                                               .ellipsis,
//                                                           textAlign:
//                                                               TextAlign.left,
//                                                           style: AppStyle
//                                                               .txtLoraRomanSemiBold2731
//                                                               .copyWith(
//                                                                   height:
//                                                                       getVerticalSize(
//                                                                           1.00))),
//                                                     )
//                                                   ])),
//                                           Container(
//                                               margin: getMargin(left: 10),
//                                               padding: getPadding(
//                                                   left: 25,
//                                                   top: 17,
//                                                   right: 25,
//                                                   bottom: 17),
//                                               decoration: AppDecoration
//                                                   .fillGray800
//                                                   .copyWith(
//                                                       borderRadius:
//                                                           BorderRadiusStyle
//                                                               .roundedBorder14),
//                                               child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Padding(
//                                                         padding:
//                                                             getPadding(top: 1),
//                                                         child: Padding(
//                                                           padding: EdgeInsets.only(
//                                                               top: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .height *
//                                                                   0.01),
//                                                           child: Column(
//                                                             children: [
//                                                               Text("Blessings in your Account ",
//                                                                   overflow:
//                                                                       TextOverflow
//                                                                           .ellipsis,
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .left,
//                                                                   style: AppStyle
//                                                                       .txtLoraRomanSemiBold10Yellow100
//                                                                       .copyWith(
//                                                                           fontSize:
//                                                                               10,
//                                                                           height:
//                                                                               getVerticalSize(1.00))),
//                                                               Text(" ",
//                                                                   overflow:
//                                                                       TextOverflow
//                                                                           .ellipsis,
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .left,
//                                                                   style: AppStyle
//                                                                       .txtLoraRomanSemiBold10Yellow100
//                                                                       .copyWith(
//                                                                           fontSize:
//                                                                               10,
//                                                                           height:
//                                                                               getVerticalSize(1.00))),
//                                                             ],
//                                                           ),
//                                                         )),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                           "$blessingsinaccount",
//                                                           overflow: TextOverflow
//                                                               .ellipsis,
//                                                           textAlign:
//                                                               TextAlign.left,
//                                                           style: AppStyle
//                                                               .txtLoraRomanSemiBold2731Yellow100
//                                                               .copyWith(
//                                                                   height:
//                                                                       getVerticalSize(
//                                                                           1.00))),
//                                                     )
//                                                   ]))
//                                         ]))
//                               ])),
//                       withdrawStatus == 0 && blessingsinaccount < 108
//                           ? Container(
//                               margin: getMargin(left: 20, top: 28, right: 20),
//                               padding: getPadding(
//                                   left: 13, top: 14, right: 13, bottom: 14),
//                               decoration: AppDecoration.outlineYellow100b22
//                                   .copyWith(
//                                       borderRadius:
//                                           BorderRadiusStyle.roundedBorder18),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Card(
//                                         clipBehavior: Clip.antiAlias,
//                                         elevation: 0,
//                                         margin: getMargin(
//                                             top: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.02,
//                                             bottom: 2),
//                                         color: ColorConstant.yellow100,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 getHorizontalSize(16.00))),
//                                         child: Container(
//                                             height: getSize(33.00),
//                                             width: getSize(33.00),
//                                             decoration: AppDecoration
//                                                 .fillYellow100
//                                                 .copyWith(
//                                                     borderRadius:
//                                                         BorderRadiusStyle
//                                                             .roundedBorder14),
//                                             child: Stack(children: [
//                                               CustomImageView(
//                                                   svgPath:
//                                                       ImageConstant.imgClock,
//                                                   height: getSize(33.00),
//                                                   width: getSize(33.00),
//                                                   alignment: Alignment.center)
//                                             ]))),
//                                     Padding(
//                                         padding: getPadding(
//                                             left: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.02,
//                                             top: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.005),
//                                         child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                   "You can convert & withdraw your",
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   textAlign: TextAlign.left,
//                                                   style: AppStyle
//                                                       .txtLoraRomanMedium1086
//                                                       .copyWith(
//                                                           fontSize: 10,
//                                                           height:
//                                                               getVerticalSize(
//                                                                   1.00))),
//                                               Padding(
//                                                 padding: getPadding(
//                                                     top: MediaQuery.of(context)
//                                                             .size
//                                                             .height *
//                                                         0.01),
//                                                 child: Text(
//                                                   "blessings to your bank account after",
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   textAlign: TextAlign.left,
//                                                   style: AppStyle
//                                                       .txtLoraRomanMedium1086
//                                                       .copyWith(
//                                                     fontSize: 10,
//                                                     height:
//                                                         getVerticalSize(1.00),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                     top: MediaQuery.of(context)
//                                                             .size
//                                                             .height *
//                                                         0.01),
//                                                 child: Text(
//                                                   "reaching the goal of 108 Blessings.",
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   textAlign: TextAlign.left,
//                                                   style: AppStyle
//                                                       .txtLoraRomanMedium1086
//                                                       .copyWith(
//                                                     fontSize: 10,
//                                                     height:
//                                                         getVerticalSize(1.00),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ])),
//                                     Spacer(),
//                                     CustomButton(
//                                         onTap: () {
//                                           // if (confirmDetails == 0) {
//                                           //   Navigator.pushNamed(
//                                           //       context, AppRoutes.bankDetails);
//                                           // } else {
//                                           //   Navigator.pushNamed(context,
//                                           //       AppRoutes.confirmDetails);
//                                           // }
//                                         },
//                                         height: 28,
//                                         width: 80,
//                                         text: "Withdraw",
//                                         margin: getMargin(top: 3, bottom: 4),
//                                         variant: ButtonVariant.grey,
//                                         shape: ButtonShape.RoundedBorder9,
//                                         fontStyle: ButtonFontStyle.darklime)
//                                   ]))
//                           : withdrawStatus == 0 && blessingsinaccount >= 108
//                               ? Container(
//                                   margin:
//                                       getMargin(left: 20, top: 28, right: 20),
//                                   padding: getPadding(
//                                       left: 13, top: 14, right: 13, bottom: 14),
//                                   decoration: AppDecoration.outlineYellow100b22
//                                       .copyWith(
//                                           borderRadius: BorderRadiusStyle
//                                               .roundedBorder18),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Card(
//                                             clipBehavior: Clip.antiAlias,
//                                             elevation: 0,
//                                             margin: getMargin(
//                                                 top: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.02,
//                                                 bottom: 2),
//                                             color: ColorConstant.yellow100,
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         getHorizontalSize(
//                                                             16.00))),
//                                             child: Container(
//                                                 height: getSize(33.00),
//                                                 width: getSize(33.00),
//                                                 decoration: AppDecoration
//                                                     .fillYellow100
//                                                     .copyWith(
//                                                         borderRadius:
//                                                             BorderRadiusStyle
//                                                                 .roundedBorder14),
//                                                 child: Stack(children: [
//                                                   CustomImageView(
//                                                       svgPath: ImageConstant
//                                                           .imgClock,
//                                                       height: getSize(33.00),
//                                                       width: getSize(33.00),
//                                                       alignment:
//                                                           Alignment.center)
//                                                 ]))),
//                                         Padding(
//                                             padding: getPadding(
//                                                 left: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.02,
//                                                 top: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.005),
//                                             child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                       "You can convert & withdraw your",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtLoraRomanMedium1086
//                                                           .copyWith(
//                                                               fontSize: 10,
//                                                               height:
//                                                                   getVerticalSize(
//                                                                       1.00))),
//                                                   Padding(
//                                                     padding: getPadding(
//                                                         top: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             0.01),
//                                                     child: Text(
//                                                       "blessings to your bank account after",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtLoraRomanMedium1086
//                                                           .copyWith(
//                                                         fontSize: 10,
//                                                         height: getVerticalSize(
//                                                             1.00),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding: getPadding(
//                                                         top: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             0.01),
//                                                     child: Text(
//                                                       "reaching the goal of 108 Blessings.",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtLoraRomanMedium1086
//                                                           .copyWith(
//                                                         fontSize: 10,
//                                                         height: getVerticalSize(
//                                                             1.00),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ])),
//                                         Spacer(),
//                                         CustomButton(
//                                             onTap: () {
//                                               if (confirmDetails == 0) {
//                                                 Navigator.pushNamed(context,
//                                                     AppRoutes.bankDetails);
//                                               } else {
//                                                 Navigator.pushNamed(context,
//                                                     AppRoutes.confirmDetails);
//                                               }
//                                             },
//                                             height: 28,
//                                             width: 80,
//                                             text: "Withdraw",
//                                             margin:
//                                                 getMargin(top: 3, bottom: 4),
//                                             // variant: ButtonVariant.grey,
//                                             shape: ButtonShape.RoundedBorder9,
//                                             fontStyle: ButtonFontStyle
//                                                 .LoraRomanSemiBold1267)
//                                       ]))
//                               : Container(
//                                   margin:
//                                       getMargin(left: 20, top: 28, right: 20),
//                                   padding: getPadding(
//                                       left: 13, top: 14, right: 13, bottom: 14),
//                                   decoration: AppDecoration.outlineYellow100b22
//                                       .copyWith(
//                                           borderRadius: BorderRadiusStyle
//                                               .roundedBorder18),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Card(
//                                             clipBehavior: Clip.antiAlias,
//                                             elevation: 0,
//                                             margin: getMargin(
//                                                 top: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.02,
//                                                 bottom: 2),
//                                             color: ColorConstant.yellow100,
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         getHorizontalSize(
//                                                             16.00))),
//                                             child: Container(
//                                                 height: getSize(33.00),
//                                                 width: getSize(33.00),
//                                                 decoration: AppDecoration
//                                                     .fillYellow100
//                                                     .copyWith(
//                                                         borderRadius:
//                                                             BorderRadiusStyle
//                                                                 .roundedBorder14),
//                                                 child: Stack(children: [
//                                                   CustomImageView(
//                                                       svgPath: ImageConstant
//                                                           .imgClock,
//                                                       height: getSize(33.00),
//                                                       width: getSize(33.00),
//                                                       alignment:
//                                                           Alignment.center)
//                                                 ]))),
//                                         Padding(
//                                             padding: getPadding(
//                                                 left: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.02,
//                                                 top: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.015),
//                                             child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                       "Convert 1000 blessings to",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtLoraRomanMedium1086
//                                                           .copyWith(
//                                                               fontSize: 14,
//                                                               height:
//                                                                   getVerticalSize(
//                                                                       1.00))),
//                                                   Padding(
//                                                     padding: getPadding(
//                                                         top: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             0.01),
//                                                     child: Text(
//                                                       "₹ 1000",
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: AppStyle
//                                                           .txtLoraRomanMedium1086
//                                                           .copyWith(
//                                                         fontSize: 17,
//                                                         height: getVerticalSize(
//                                                             1.00),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ])),
//                                         Spacer(),
//                                         CustomButton(
//                                             onTap: () {
//                                               if (confirmDetails == 0) {
//                                                 Navigator.pushNamed(context,
//                                                     AppRoutes.bankDetails);
//                                               } else {
//                                                 Navigator.pushNamed(context,
//                                                     AppRoutes.confirmDetails);
//                                               }
//                                             },
//                                             height: 28,
//                                             width: 80,
//                                             text: "Withdraw",
//                                             margin:
//                                                 getMargin(top: 3, bottom: 4),
//                                             // variant: ButtonVariant.grey,
//                                             shape: ButtonShape.RoundedBorder9,
//                                             fontStyle: ButtonFontStyle
//                                                 .LoraRomanSemiBold1267)
//                                       ])),
//                       Padding(
//                           padding: getPadding(left: 32, top: 25, right: 32),
//                           child: GestureDetector(
//                             onTap: () {
//                               // Navigator.pushNamed(
//                               //     context, AppRoutes.userProfile);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => UserProfile(
//                                             dataa: [
//                                               userFullName,
//                                               userEmail,
//                                               userPhone,
//                                               userGender,
//                                               userDOB
//                                             ],
//                                           )));
//                             },
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Account information",
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.left,
//                                       style: AppStyle.txtLoraRomanSemiBold16
//                                           .copyWith(
//                                               height: getVerticalSize(1.00))),
//                                   CustomImageView(
//                                       svgPath: ImageConstant.imgVector,
//                                       height: getVerticalSize(10.00),
//                                       width: getHorizontalSize(5.00),
//                                       margin: getMargin(top: 5, bottom: 5))
//                                 ]),
//                           )),
//                       Container(
//                           height: getVerticalSize(1.00),
//                           width: size.width,
//                           margin: getMargin(top: 15),
//                           decoration:
//                               BoxDecoration(color: ColorConstant.yellow10026)),
//                       Padding(
//                           padding: getPadding(left: 32, top: 15, right: 32),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Bank details and transactions",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtLoraRomanSemiBold16
//                                         .copyWith(
//                                             height: getVerticalSize(1.00))),
//                                 CustomImageView(
//                                     svgPath: ImageConstant.imgVector,
//                                     height: getVerticalSize(10.00),
//                                     width: getHorizontalSize(5.00),
//                                     margin: getMargin(top: 5, bottom: 5))
//                               ])),
//                       Container(
//                           height: getVerticalSize(1.00),
//                           width: size.width,
//                           margin: getMargin(top: 15),
//                           decoration:
//                               BoxDecoration(color: ColorConstant.yellow10026)),
//                       Padding(
//                           padding: getPadding(left: 32, top: 15, right: 32),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Your timeline",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtLoraRomanSemiBold16
//                                         .copyWith(
//                                             height: getVerticalSize(1.00))),
//                                 CustomImageView(
//                                     svgPath: ImageConstant.imgVector,
//                                     height: getVerticalSize(10.00),
//                                     width: getHorizontalSize(5.00),
//                                     margin: getMargin(top: 5, bottom: 5))
//                               ])),
//                       Container(
//                           height: getVerticalSize(1.00),
//                           width: size.width,
//                           margin: getMargin(top: 15),
//                           decoration:
//                               BoxDecoration(color: ColorConstant.yellow10026)),
//                       Padding(
//                           padding: getPadding(left: 32, top: 15, right: 32),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Notifications",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtLoraRomanSemiBold16
//                                         .copyWith(
//                                             height: getVerticalSize(1.00))),
//                                 CustomImageView(
//                                     svgPath: ImageConstant.imgVector,
//                                     height: getVerticalSize(10.00),
//                                     width: getHorizontalSize(5.00),
//                                     margin: getMargin(top: 5, bottom: 5))
//                               ])),
//                       Container(
//                           height: getVerticalSize(1.00),
//                           width: size.width,
//                           margin: getMargin(top: 15),
//                           decoration:
//                               BoxDecoration(color: ColorConstant.yellow10026)),
//                       GestureDetector(
//                         onTap: () async {
//                           await FirebaseAuth.instance.signOut();
//                           Navigator.of(context)
//                               .pushReplacementNamed(AppRoutes.googlesignin);
//                         },
//                         child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                                 padding: getPadding(left: 32, top: 17),
//                                 child: Text("Logout",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppStyle.txtLoraRomanSemiBold16
//                                         .copyWith(
//                                             height: getVerticalSize(1.00))))),
//                       ),
//                       Container(
//                           height: getVerticalSize(1.00),
//                           width: size.width,
//                           margin: getMargin(top: 13, bottom: 5),
//                           decoration:
//                               BoxDecoration(color: ColorConstant.yellow10026))
//                     ]),
//               ))),
//     );
//   }

//   onTapArrowleft2(BuildContext context) {
//     Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
//     FocusScope.of(context).unfocus();
//     return false;
//   }

//   void values() {
//     final firestore = FirebaseFirestore.instance;
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       // Get the current value
//       DocumentReference documentReference =
//           firestore.collection("bless").doc(user.email);
//       documentReference.get().then((DocumentSnapshot snapshot) {
//         int tbe = (snapshot.data() as Map)['Total Blessings Earned'];
//         int bia = (snapshot.data() as Map)['Blessings in account'];

//         // Add to the current value
//         // print(currentValue);
//         // Write the updated value back to the Firestore

//         setState(() {
//           totalblessingsearned = tbe;
//           blessingsinaccount = bia;
//           // typedram=currentValue;
//           // typedramtoday=trt;
//           // blessingsearnedtoday=bet;
//         });
//       });

//       DocumentReference ref = firestore.collection("Users").doc(user.email);
//       ref.get().then((DocumentSnapshot snapshot) {
//         String email = (snapshot.data() as Map)['Email'];
//         String fullname = (snapshot.data() as Map)['Fullname'];
//         String phone = (snapshot.data() as Map)['Phone'];
//         String gender = (snapshot.data() as Map)['Gender'];
//         String dob = (snapshot.data() as Map)['DOB'];

//         int withdraw = (snapshot.data() as Map)['Withdraw'];

//         // Add to the current value
//         // print(currentValue);
//         // Write the updated value back to the Firestore
//         if (_mounted) {
//           setState(() {
//             letterFirstFullName = fullname[0];
//             userEmail = email;
//             userFullName = fullname;
//             userPhone = phone;
//             userGender = gender;
//             userDOB = dob;
//             withdrawStatus = withdraw;

//             // subStringuserFullName = fullname.substring(0, 1).toUpperCase();
//             // finalStringuserFullName = subStringuserFullName;
//             // typedram=currentValue;
//             // typedramtoday=trt;
//             // blessingsearnedtoday=bet;
//           });
//         }
//       });
//     }
//   }

//   void bankConfirmValues() {
//     final firestore = FirebaseFirestore.instance;
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       // Get the current value
//       DocumentReference ref =
//           firestore.collection("Bank Details").doc(user.email);
//       ref.get().then((DocumentSnapshot snapshot) {
//         int cD = (snapshot.data() as Map)['Confirm Details'];

//         // snapshot.reference.update({
//         //   // 'Bank Name': bankNameController.text,
//         //   // 'IFSC Code': ifscCodeController.text,
//         //   // 'Account Number': accountNumberController.text,
//         //   // 'PAN Card Number': panCardController.text,
//         //   'Confirm Details': 1,
//         // });
//         // Add to the current value
//         // print(currentValue);
//         // Write the updated value back to the Firestore
//         setState(() {
//           confirmDetails = cD;
//           // subStringuserFullName = userFullName.substring(0, 1).toUpperCase();

//           // typedram=currentValue;
//           // typedramtoday=trt;
//           // blessingsearnedtoday=bet;
//         });
//       });
//     }
//   }
// }
