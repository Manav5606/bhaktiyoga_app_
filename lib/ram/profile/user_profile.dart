import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/profile/request_dilaog.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_subtitle.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

class UserProfile extends StatefulWidget {
  final List<String>? dataa;

  UserProfile({this.dataa});
  @override
  State<UserProfile> createState() => _UserProfileState();
}

String hello = ImageConstant.imgUser;
String imgMail = ImageConstant.imgMail;
String imgPhone = ImageConstant.imgCall;
String imgGender = ImageConstant.imgGender;
String imgCalendar = ImageConstant.imgCalendar;
String fullNameUser = "";
String firestLetterUser = "u";
String emailUser = "";
String phoneUser = "";
String genderUser = "";
String dobUser = "";

class _UserProfileState extends State<UserProfile> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    values();
    // _timer = Timer.periodic(Duration(seconds: 3), (Timer t) => values());
  }

  @override
  void dispose() {
    // _timer.cancel();

    super.dispose();
    values();
  }

  final images = [
    hello,
    imgMail,
    imgPhone,
    imgGender,
    imgCalendar,
  ];

  final user = [
    "Fullname",
    "Email",
    "Phone",
    "Gender",
    "DOB",
  ];

  List<String> userDeatils = [
    fullNameUser,
    emailUser,
    phoneUser,
    genderUser,
    dobUser,
  ];

  @override
  Widget build(BuildContext context) {
    values();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.blessingDetails);
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: size.width * 1.2,
                          height: size.height * 0.57,
                          padding: getPadding(top: 23, bottom: 23),
                          decoration: AppDecoration.fillLime900.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBR37),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomAppBar(
                                    height: getVerticalSize(56.00),
                                    leadingWidth: 34,
                                    leading: AppbarImage(
                                        height: getVerticalSize(22.00),
                                        width: getHorizontalSize(13.00),
                                        svgPath: ImageConstant.imgArrowleft,
                                        margin: getMargin(left: 21, bottom: 2),
                                        onTap: () => onTapArrowleft3(context)),
                                    centerTitle: true,
                                    title: AppbarSubtitle(text: "My Profile")),
                                Container(
                                  width: getHorizontalSize(120.00),
                                  margin: getMargin(
                                      left: MediaQuery.of(context).size.height *
                                          0.165,
                                      top: MediaQuery.of(context).size.height *
                                          0.04,
                                      right:
                                          MediaQuery.of(context).size.height *
                                              0.16),
                                  padding: getPadding(
                                      left: 28, top: 15, right: 28, bottom: 20),
                                  decoration: AppDecoration.fillYellow100
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder55),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.035,
                                        ),
                                        child: Text(
                                          firestLetterUser.toUpperCase(),
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
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: getPadding(top: 14),
                                    child: Text(fullNameUser,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLoraRomanSemiBold28
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.00)))),
                                Padding(
                                    padding: getPadding(top: 6),
                                    child: Text(emailUser,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLoraRomanSemiBold12
                                            .copyWith(
                                                fontSize: 15,
                                                height:
                                                    getVerticalSize(1.00)))),
                                CustomButton(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                                content: RequestDialog(),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ));
                                    },
                                    height: 27,
                                    width: 166,
                                    text: "Request Change",
                                    margin: getMargin(top: 22),
                                    padding: ButtonPadding.PaddingT5,
                                    prefixWidget: Container(
                                        margin: getMargin(right: 10),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgEdit)))
                              ])),
                      Padding(
                          padding: getPadding(
                            left: 26,
                            top: 0,
                            right: 10,
                          ),
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(23.00));
                              },
                              itemCount: widget.dataa!.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    CustomImageView(
                                      svgPath: images[index],
                                      height: getSize(
                                        35.00,
                                      ),
                                      width: getSize(
                                        35.00,
                                      ),
                                      margin: getMargin(
                                        top: 1,
                                        bottom: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: getVerticalSize(
                                              13.00,
                                            ),
                                            width: getHorizontalSize(
                                              93.00,
                                            ),
                                            margin: getMargin(
                                              left: 2,
                                            ),
                                            decoration:
                                                AppDecoration.fillGray900,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: getVerticalSize(
                                                      12.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      43.00,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.gray900,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    user[index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtLoraRomanRegular10
                                                        .copyWith(
                                                      fontSize: 12,
                                                      height: getVerticalSize(
                                                        1.00,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              top: 3,
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                widget.dataa![index],
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtLoraRomanMedium16
                                                    .copyWith(
                                                  height: getVerticalSize(
                                                    1.00,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }))
                    ]),
              ))),
    );
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.blessingDetails);
    FocusScope.of(context).unfocus();
    return false;
  }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        String fullname = (snapshot.data() as Map)['Fullname'];
        String email = (snapshot.data() as Map)['Email'];
        String phone = (snapshot.data() as Map)['Phone'];
        String gender = (snapshot.data() as Map)['Gender'];
        String dob = (snapshot.data() as Map)['DOB'];
        List user = [
          fullname,
          email,
          phone,
          gender,
          dob,
        ];
        setState(() {
          firestLetterUser = fullname[0];
          fullNameUser = fullname;
          emailUser = email;
          phoneUser = phone;
          genderUser = gender;
          dobUser = dob;
          user = userDeatils;
        });
      });
    }
  }
}
