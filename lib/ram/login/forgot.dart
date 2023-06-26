//  onTap: () async {
//                     try {
//                       await FirebaseAuth.instance.sendPasswordResetEmail(
//                           email: "manavpatel528@gmail.com");
//                           Fluttertoast.showToast(msg: "Password reset link sent! Check Your Email");
//                     } on FirebaseAuthException catch (e) {
//                       print(e);
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                                 content: Text(
//                               e.message.toString(),
//                             ));
//                           });
//                     }
//                   },

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_title.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

import '../../widgets/custom_text_form_field.dart';
import '../../widgets/rounded_text_files.dart';

// ignore: must_be_immutable
class Forgot extends StatefulWidget {
  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEmailValid = false;
  String? _email;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.signIn);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        appBar: CustomAppBar(
            height: getVerticalSize(96.00),
            leadingWidth: 29,
            leading: AppbarImage(
                height: getVerticalSize(25.00),
                width: getHorizontalSize(20.00),
                svgPath: ImageConstant.imgArrowleftYellow100,
                margin: getMargin(left: 21, top: 57, bottom: 23),
                onTap: () => onTapArrowleft1(context)),
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: AppbarTitle(text: "Forgot Password"),
            )),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width * 1.2,
            padding: getPadding(left: 20, top: 30, right: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  // : "Email*",
                  // validator: validator,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    } else if (!value.contains("@")) {
                      return "Please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _email = value;
                    _isEmailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_email!);
                  },
                  decoration: InputDecoration(
                    labelText: "Email*",
                    labelStyle: TextStyle(
                      color: ColorConstant.red200,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      borderSide: BorderSide(
                        color:
                            _isEmailValid ? ColorConstant.red200 : Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      borderSide: BorderSide(
                        color: ColorConstant.red200,
                        // width: 2.0,
                      ),
                    ),
                  ),
                  style: TextStyle(color: ColorConstant.red200),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signIn);
                  },
                  child: Padding(
                    padding: getPadding(
                        top: 22, left: MediaQuery.of(context).size.width * 0.3),
                    child: Text(
                      "Login To Your Account",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLoraRomanSemiBold16.copyWith(
                        height: getVerticalSize(1.00),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.homeScreen);
                  },
                  child: Container(
                    width: getHorizontalSize(349.00),
                    margin: getMargin(left: 4, top: 29),
                    padding: getPadding(all: 5),
                    decoration: AppDecoration.outlineLime900.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder29),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomButton(
                            onTap: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                try {
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                          email: emailController.text.trim());
                                  Fluttertoast.showToast(
                                      msg:
                                          "Password reset link sent! Check Your Email");
                                } on FirebaseAuthException catch (e) {
                                  print(e);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            content: Text(
                                          e.message.toString(),
                                        ));
                                      });
                                }
                              }
                            },
                            height: 48,
                            width: 338,
                            text: "Reset Password",
                            variant: ButtonVariant.OutlineLime900,
                            shape: ButtonShape.CircleBorder24,
                            padding: ButtonPadding.PaddingAll11,
                            fontStyle:
                                ButtonFontStyle.LoraRomanSemiBold18Yellow100)
                      ],
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushNamed(context, AppRoutes.signUp);
                //   },
                //   child: Padding(
                //     padding: getPadding(top: 27, bottom: 5),
                //     child: Text(
                //       "Don't have an account? Register",
                //       overflow: TextOverflow.ellipsis,
                //       textAlign: TextAlign.left,
                //       style: AppStyle.txtLoraRomanSemiBold16.copyWith(
                //         height: getVerticalSize(1.00),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
