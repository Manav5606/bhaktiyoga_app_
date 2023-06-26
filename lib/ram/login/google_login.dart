import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/ram/login/auth_service.dart';
import 'package:bhaktiyoga_ios/ram/splash/home_splash.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../dynamic_links/dynamic_link.dart';
import '../home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? _user;

  Future<void> signInWithApple() async {
    // Check if Sign in with Apple is available on the device
    final isAvailable = await SignInWithApple.isAvailable();

    if (!isAvailable) {
      Fluttertoast.showToast(msg: "Sign in with Apple is not available.");
      throw FirebaseAuthException(
        code: 'ERROR_MISSING_SIGN_IN_WITH_APPLE',
        message: 'Sign in with Apple is not available on this device.',
      );
    }

    // Start the authentication flow
    final appleResult = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print(AppleIDAuthorizationScopes.email);
    // Create a new Firebase credential with the Apple ID credential

    final AuthCredential credential = OAuthProvider('apple.com').credential(
      accessToken:
          String.fromCharCodes(appleResult.authorizationCode.codeUnits),
      idToken: String.fromCharCodes(appleResult.identityToken!.codeUnits),
    );

    // Once signed in, return the UserCredential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Update the UI with the user's name and email
    setState(() {
      _user = userCredential.user;
    });

    DynamicLinkProvider().initDynamicLink(_user!.email!);
    await reg();
  }

  Future reg() async {
    if (_user != null) {
      // Check if user already exists in the "Users" collection
      final userDoc =
          FirebaseFirestore.instance.collection('Users').doc(_user!.email);
      final userDocSnapshot = await userDoc.get();

      if (!userDocSnapshot.exists) {
        // User does not exist, create a new document in the "Users" collection with the user's UID
        await userDoc.set({
          'Fullname': _user!.displayName,
          'Email': _user!.email,
          'Phone': '',
          'Gender': '',
          'DOB': '',
          'Passowrd': "",
          'Verify Details': 0,
          'Withdraw': 0,
          'JoinDate': DateTime.now()
          // Add any other user details you want to store
        });

        final Random random = Random();
        String id = (random.nextInt(92143543) + 094512343560).toString();
        final userBless =
            FirebaseFirestore.instance.collection('bless').doc(_user!.email);
        await userBless.set({
          'Total Blessings Earned': 0,
          'Blessing Earned Today': 0,
          'Blessings in account': 0,
          'Typed Ram': 0,
          'Typed Ram Today': 0,
          "referCode": id,
          // Add any other user details you want to store
        });
      }

      await AuthService().handleAuthState();

      // Navigate to HomeScreen or other desired screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    }
  }

  // Future reg() async {
  //   if (_user != null) {
  //     // Create a new document in the "users" collection with the user's UID
  //     final userDoc =
  //         FirebaseFirestore.instance.collection('Users').doc(_user!.email);
  //     await userDoc.set({
  //       'Fullname': _user!.displayName,
  //       'Email': _user!.email,
  //       'Phone': 'phoneController.text',
  //       'Gender': 'genderController.text',
  //       'DOB': 'dobController.text',
  //       'Passowrd': "",
  //       'Verify Details': 0,
  //       'Withdraw': 0,
  //       'JoinDate': DateTime.now()
  //       // Add any other user details you want to store
  //     });
  //     final Random random = Random();
  //     String id = (random.nextInt(92143543) + 094512343560).toString();
  //     final userBless =
  //         FirebaseFirestore.instance.collection('bless').doc(_user!.email);
  //     await userBless.set({
  //       'Total Blessings Earned': 0,
  //       'Blessing Earned Today': 0,
  //       'Blessings in account': 0,
  //       'Typed Ram': 0,
  //       'Typed Ram Today': 0,
  //       "referCode": id,
  //       // Add any other user details you want to store
  //     });

  //    await AuthService().handleAuthState();

  //     // Navigator.pushReplacement(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => HomeScreen()),
  //     // );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeSplash()));
        FocusScope.of(context).unfocus();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: ColorConstant.lime900,
        body: Container(
          width: size.width * 1.2,
          padding: getPadding(
            left: 21,
            top: MediaQuery.of(context).size.height * 0.25,
            right: 21,
            bottom: 55,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  263.00,
                ),
                width: getHorizontalSize(
                  265.00,
                ),
                margin: getMargin(
                  top: 8,
                ),
                child: Column(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgGroup8,
                      height: getVerticalSize(
                        MediaQuery.of(context).size.height * 0.21,
                      ),
                      width: getHorizontalSize(
                        234.00,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Text(
                          "BHAKTHIYOGA",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLoraRomanSemiBold28040.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.66,
                            ),
                            height: getVerticalSize(
                              2.00,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // Container(
              //   height: 60,
              //   width: 240,
              //   child: SignInButton(
              //     Buttons.AppleDark,
              //     onPressed: () {
              //       // AuthService().signInWithApple();
              //       signInWithApple();
              //       // AuthService().data();
              //     },
              //     text: "Sign In with Apple",
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              GestureDetector(
                onTap: () {
                  AuthService().signInWithGoogle();
                },
                child: Container(
                  // color: Colors.black,
                  width: getHorizontalSize(
                    240.00,
                  ),
                  height: 60,

                  // margin: getMargin(
                  //   left: 2,
                  // ),
                  // padding: getPadding(
                  //   all: 5,
                  // ),
                  // decoration: AppDecoration.outlineYellow100.copyWith(
                  //   borderRadius: BorderRadiusStyle.circleBorder29,
                  // ),
                  decoration: BoxDecoration(
                    color: ColorConstant
                        .lime900, // Set a background color for the container
                    borderRadius: BorderRadius.circular(
                        10), // Set a circular border radius for the container
                  ),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                        'assets/images/download.png', // Replace with your asset image path
                        fit: BoxFit.contain
                        // Use BoxFit.cover to scale the image to fit the container
                        ),
                  ),
                  // child: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     GestureDetector(
                  //         onTap: () {
                  //           AuthService().signInWithGoogle();
                  //         },
                  //         child: const Image(
                  //             // height: 200,
                  //             width: 250,
                  //             image: AssetImage('assets/images/download.png'))),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
      // child: Scaffold(
      //   backgroundColor: ColorConstant.gray900,
      //   appBar: AppBar(
      //     title: Text(
      //       "Google Login",
      //       style: TextStyle(color: ColorConstant.yellow100),
      //     ),
      //     backgroundColor: ColorConstant.gray900,
      //   ),
      //   body: Container(
      //     width: size.width,
      //     height: size.height,
      //     padding: EdgeInsets.only(
      //         left: 20,
      //         right: 20,
      //         top: size.height * 0.2,
      //         bottom: size.height * 0.5),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         // CircularProgressIndicator(),
      //         Text("Hello, \nSign in with Google",
      //             style:
      //                 TextStyle(fontSize: 30, color: ColorConstant.yellow100)),
      //         GestureDetector(
      //             onTap: () {
      //               AuthService().signInWithGoogle();
      //             },
      //             child: const Image(
      //                 // height: 200,
      //                 width: 200,
      //                 image: AssetImage('assets/images/download.png'))),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
