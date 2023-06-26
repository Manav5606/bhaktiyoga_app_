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
class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEmailValid = false;
  String? _email;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.signUp);
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
              child: AppbarTitle(text: "Login to your account"),
            )),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width * 1.2,
            padding: getPadding(left: 20, top: 30, right: 20, bottom: 30),
            child: SingleChildScrollView(
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
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.030,
                  ),
                  TextFormField(
                    // labelText: "Password*",
                    // validator: validator,
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Password*",
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
                      Navigator.pushNamed(context, AppRoutes.forgot);
                    },
                    child: Padding(
                      padding: getPadding(
                          top: 22,
                          left: MediaQuery.of(context).size.width * 0.5),
                      child: Text(
                        "Forgot password?",
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
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   _signInWithEmailAndPassword();
                      //   Navigator.pushNamed(context, AppRoutes.homeScreen);
                      // }
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
                              onTap: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  logInUser();
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please enter valid email address and password");
                                }
                              },
                              height: 48,
                              width: 338,
                              text: "LogIn",
                              variant: ButtonVariant.OutlineLime900,
                              shape: ButtonShape.CircleBorder24,
                              padding: ButtonPadding.PaddingAll11,
                              fontStyle:
                                  ButtonFontStyle.LoraRomanSemiBold18Yellow100)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    child: Padding(
                      padding: getPadding(top: 27, bottom: 5),
                      child: Text(
                        "Don't have an account? Register",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLoraRomanSemiBold16.copyWith(
                          height: getVerticalSize(1.00),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signUp);
  }

  Future logInUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          // User? user = result.user;
          .then((value) => {
                print("Success"),
                Navigator.pushNamed(context, AppRoutes.homeScreen),
              });
    } catch (e) {
      print(e);
    }
  }

  void _signInWithEmailAndPassword() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        print("true");
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      } else {
        print("false");
        Fluttertoast.showToast(msg: "Email or Password is incorrect");
      }
    } catch (e) {}
  }
}
