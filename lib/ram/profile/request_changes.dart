import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/profile/request_process_dialog.dart';
import 'package:bhaktiyoga_ios/ram/profile/user_profile.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:bhaktiyoga_ios/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class RequestChanges extends StatefulWidget {
  @override
  State<RequestChanges> createState() => _RequestChangesState();
}

class _RequestChangesState extends State<RequestChanges> {
  TextEditingController frameThirtyThreeController = TextEditingController();

  String userEmail = "";
  String userFullName = "";
  String userPhone = "";
  String userGender = "";
  String userDOB = "";
  @override
  void initState() {
    // TODO: implement initState
    values();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    values();
    return WillPopScope(
      onWillPop: () async {
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
        FocusScope.of(context).unfocus();
        return false;
      },
      child: Scaffold(
          backgroundColor: ColorConstant.gray900,
          resizeToAvoidBottomInset: false,
          body: Container(
              width: size.width * 1.2,
              padding: getPadding(left: 20, top: 27, right: 20, bottom: 27),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          onTap: () => onTapArrowleft2(context)),
                    ),
                    Padding(
                        padding: getPadding(left: 4, top: 30),
                        child: Text("Request Changes",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanSemiBold28)),
                    CustomTextFormField(
                        width: size.width * 1.2,
                        focusNode: FocusNode(),
                        controller: frameThirtyThreeController,
                        hintText:
                            "Explain in detail what you’d like to change...",
                        margin: getMargin(top: 23),
                        textInputAction: TextInputAction.done,
                        maxLines: 9),
                    Container(
                        width: getHorizontalSize(349.00),
                        margin: getMargin(left: 20, top: 52, bottom: 5),
                        padding: getPadding(all: 5),
                        decoration: AppDecoration.outlineLime900.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder29),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomButton(
                                  onTap: () {
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
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                              content: RequestProcessDialog(),
                                              backgroundColor:
                                                  Colors.transparent,
                                            ));
                                  },
                                  height: 48,
                                  width: 338,
                                  text: "Request",
                                  variant: ButtonVariant.FillLime900,
                                  shape: ButtonShape.CircleBorder24,
                                  // padding: ButtonPadding.PaddingAll9,
                                  fontStyle: ButtonFontStyle
                                      .LoraRomanSemiBold18Yellow100)
                            ]))
                  ]))),
    );
  }

  onTapArrowleft2(BuildContext context) {
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
    FocusScope.of(context).unfocus();
    return false;
  }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
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

        setState(() {
          userEmail = email;
          userFullName = fullname;
          userPhone = phone;
          userGender = gender;
          userDOB = dob;

          // subStringuserFullName = fullname.substring(0, 1).toUpperCase();
          // finalStringuserFullName = subStringuserFullName;
          // typedram=currentValue;
          // typedramtoday=trt;
          // blessingsearnedtoday=bet;
        });
      });
    }
  }
}
