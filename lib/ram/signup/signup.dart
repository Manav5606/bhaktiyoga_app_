import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/dynamic_links/dynamic_link.dart';
import 'package:bhaktiyoga_ios/ram/home/home.dart';
import 'package:bhaktiyoga_ios/ram/splash/home_splash.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_title.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:bhaktiyoga_ios/widgets/custom_drop_down.dart';
import 'package:bhaktiyoga_ios/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import '../../widgets/rounded_text_files.dart';
import '../login/login.dart';

// ignore_for_file: must_be_immutable

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullNameController = TextEditingController();

  // TextEditingController emailController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  List<String> dropdownItemList = ["male", "female", "other"];

  TextEditingController phoneController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();

  // TextEditingController passwordConfirmController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showError = false;
  bool _isEmailValid = false;
  String? _email;
  String _selectedItem = 'Male';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeSplash()));
        FocusScope.of(context).unfocus();
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: ColorConstant.gray900,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
              height: getVerticalSize(96.00),
              leadingWidth: 29,
              leading: AppbarImage(
                  height: getVerticalSize(55.00),
                  width: getHorizontalSize(20.00),
                  svgPath: ImageConstant.imgArrowleftYellow100,
                  margin: getMargin(left: 21, top: 57, bottom: 23),
                  onTap: () => onTapArrowleft(context)),
              title: AppbarTitle(
                  text: "Create Account",
                  margin: getMargin(left: 24, top: 38))),
          body: Form(
              key: _formKey,
              child: Container(
                  width: size.width * 1.2,
                  height: size.height * 1.2,
                  padding: getPadding(left: 20, top: 0, right: 20, bottom: 30),
                  child: SingleChildScrollView(
                    // keyboardDismissBehavior: K,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              // labelText: "Fullname*",
                              // validator: validator,
                              controller: fullNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _showError = true;
                                  });
                                  return 'Please enter some text';
                                }
                                setState(() {
                                  _showError = false;
                                });
                                return null;

                                // return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Full Name*",
                                labelStyle: TextStyle(
                                  color: ColorConstant.red200,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: _isEmailValid
                                        ? ColorConstant.red200
                                        : Colors.red,
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
                          ),
                          Divider(
                            height: MediaQuery.of(context).size.height * 0.020,
                          ),
                          // TextFormField(
                          //   // : "Email*",
                          //   // validator: validator,
                          //   controller: emailController,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter your email";
                          //     } else if (!value.contains("@")) {
                          //       return "Please enter a valid email";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          //   onChanged: (value) {
                          //     _email = value;
                          //     _isEmailValid = RegExp(
                          //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          //         .hasMatch(_email!);
                          //   },
                          //   decoration: InputDecoration(
                          //     labelText: "Email*",
                          //     labelStyle: TextStyle(
                          //       color: ColorConstant.red200,
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(35.0),
                          //       borderSide: BorderSide(
                          //         color: _isEmailValid
                          //             ? ColorConstant.red200
                          //             : Colors.red,
                          //       ),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(35.0),
                          //       borderSide: BorderSide(
                          //         color: ColorConstant.red200,
                          //         // width: 2.0,
                          //       ),
                          //     ),
                          //   ),
                          //   style: TextStyle(color: ColorConstant.red200),
                          // ),
                          // Divider(
                          //   height: MediaQuery.of(context).size.height * 0.020,
                          // ),
                          TextFormField(
                            // labelText: "Phone*",
                            // validator: validator,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your phone number";
                              } else if (value.length != 10) {
                                return "Please enter a valid phone number of 10 digits";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Phone*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
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
                          // CustomDropDown(
                          //     width: 345,
                          //     focusNode: FocusNode(),
                          //     icon: Container(
                          //         margin: getMargin(left: 50, right: 17),
                          //         child: CustomImageView(
                          //             svgPath: ImageConstant.imgArrowdown)),
                          //     hintText: "Gender*",
                          //     margin: getMargin(top: 24),
                          //     items: dropdownItemList,
                          //     onChanged: (value) {
                          //       genderController.text = value;
                          //       if (genderController.text.isEmpty) {
                          //         return "Please select the gender";
                          //       }
                          //     }

                          //     ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Container(
                              width: size.width * 1.2,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(color: ColorConstant.red200),
                                // color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 15.0, top: 2),
                                child: DropdownButtonFormField<String>(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  // underline: Container(height: 0.0),
                                  value: _selectedItem,
                                  items: <String>['Male', 'Female', 'Other']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(
                                        value,
                                        style: TextStyle(
                                            color: ColorConstant.red200),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedItem = newValue!;
                                      genderController.text = _selectedItem;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please select a gender';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: MediaQuery.of(context).size.height * 0.020,
                          ),
                          TextFormField(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(200),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  dobController.text = DateFormat('yyyy-MM-dd')
                                      .format(pickedDate)
                                      .toString();
                                });
                              }
                            },
                            controller: dobController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month_outlined),
                              labelText: "Date Of Birth*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide:
                                    BorderSide(color: ColorConstant.red200),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
                                ),
                              ),
                            ),
                            style: TextStyle(color: ColorConstant.red200),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+-\d{2}-\d{2}$')),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your date of birth";
                              } else if (!RegExp(r'^\d{4}-\d{2}-\d{2}$')
                                  .hasMatch(value)) {
                                return "Please enter date in the format yyyy-MM-dd";
                              }
                              return null;
                            },
                          ),
                          Divider(
                            height: MediaQuery.of(context).size.height * 0.020,
                          ),
                          // TextFormField(
                          //   // labelText: "Password*",
                          //   // validator: validator,
                          //   controller: passwordController,
                          //   obscureText: true,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter your password";
                          //     } else if (value.length < 6) {
                          //       return "Password must be at least 6 characters";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          //   decoration: InputDecoration(
                          //     labelText: "Password*",
                          //     labelStyle: TextStyle(
                          //       color: ColorConstant.red200,
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(35.0),
                          //       borderSide: BorderSide(
                          //         color: _isEmailValid
                          //             ? ColorConstant.red200
                          //             : Colors.red,
                          //       ),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(35.0),
                          //       borderSide: BorderSide(
                          //         color: ColorConstant.red200,
                          //         // width: 2.0,
                          //       ),
                          //     ),
                          //   ),
                          //   style: TextStyle(color: ColorConstant.red200),
                          // ),
                          // Divider(
                          //   height: MediaQuery.of(context).size.height * 0.020,
                          // ),
                          // TextFormField(
                          //   // validator: validator,
                          //   controller: passwordConfirmController,
                          //   obscureText: true,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please confirm your password";
                          //     } else if (value != passwordController.text) {
                          //       return "Passwords do not match";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          //   decoration: InputDecoration(
                          //     labelText: "Confirm password*",
                          //     labelStyle: TextStyle(
                          //       color: ColorConstant.red200,
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(35.0),
                          //       borderSide: BorderSide(
                          //         color: _isEmailValid
                          //             ? ColorConstant.red200
                          //             : Colors.red,
                          //       ),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(35.0),
                          //       borderSide: BorderSide(
                          //         color: ColorConstant.red200,
                          //         // width: 2.0,
                          //       ),
                          //     ),
                          //   ),
                          //   style: TextStyle(color: ColorConstant.red200),
                          // ),
                          Container(
                              width: getHorizontalSize(349.00),
                              margin: getMargin(left: 4, top: 19),
                              padding: getPadding(all: 5),
                              decoration: AppDecoration.outlineLime900.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder29),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomButton(
                                        onTap: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            DynamicLinkProvider()
                                                .initDynamicLink(
                                                    fullNameController.text);
                                            reg();
                                          }
                                          // blessingsDetails();
                                        },
                                        height: 48,
                                        width: 338,
                                        text: "Create Account",
                                        variant: ButtonVariant.OutlineLime900,
                                        shape: ButtonShape.CircleBorder24,
                                        padding: ButtonPadding.PaddingAll11,
                                        fontStyle: ButtonFontStyle
                                            .LoraRomanSemiBold18Yellow100)
                                  ])),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pushNamed(context, AppRoutes.signIn);
                          //   },
                          //   child: Padding(
                          //       padding: getPadding(top: 17, bottom: 5),
                          //       child: Text("Already have an account? Login",
                          //           overflow: TextOverflow.ellipsis,
                          //           textAlign: TextAlign.left,
                          //           style: AppStyle.txtLoraRomanSemiBold16
                          //               .copyWith(
                          //                   height: getVerticalSize(1.00)))),
                          // )
                        ]),
                  )))),
    );
  }

  onTapArrowleft(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeSplash()));
    FocusScope.of(context).unfocus();
  }

  Future reg() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Create a new document in the "users" collection with the user's UID
      final userDoc =
          FirebaseFirestore.instance.collection('Users').doc(user.email);
      await userDoc.set({
        'Fullname': fullNameController.text,
        'Email': user.email,
        'Phone': phoneController.text,
        'Gender': genderController.text,
        'DOB': dobController.text,
        'Passowrd': "",
        'Verify Details': 0,
        'Withdraw': 0,
        'JoinDate':DateTime.now()
        // Add any other user details you want to store
      });
      final Random random = Random();
      String id = (random.nextInt(92143543) + 094512343560).toString();
      final userBless =
          FirebaseFirestore.instance.collection('bless').doc(user.email);
      await userBless.set({
        'Total Blessings Earned': 0,
        'Blessing Earned Today': 0,
        'Blessings in account': 0,
        'Typed Ram': 0,
        'Typed Ram Today': 0,
        "referCode": id,
        // Add any other user details you want to store
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  // void getToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     setState(() {
  //       mtoken = token;
  //       print("My token is $mtoken");
  //     });
  //     saveToken(token!);
  //   });
  // }

  // void saveToken(String token) async{
  //   await FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(FirebaseAuth.instance.currentUser!.email)
  //       .update({'token': token});
  // }
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
            "to": "94579674625"
          }));
    } catch (e) {}
  }
  // Future registerUser() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = await FirebaseAuth.instance.currentUser;

  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(
  //             email: emailController.text, password: passwordController.text)
  //         .then((signedInUser) => {
  //               FirebaseFirestore.instance
  //                   .collection("Users")
  //                   .doc(signedInUser.user!.email)
  //                   .set({
  //                 'Fullname': fullNameController.text,
  //                 'Email': emailController.text,
  //                 'Phone': phoneController.text,
  //                 'Gender': 'Male',
  //                 'DOB': dobController.text,
  //                 'Passowrd': passwordController.text,
  //                 'Verify Details': 0,
  //                 'Withdraw': 0,
  //               }).then((signedInUser) => {
  //                         // FirebaseFirestore.instance.collection("Blessings").doc(user!.email).set({
  //                         // 'Total Blessings Earned':0,
  //                         // 'Blessings Earned today':0,
  //                         // 'Blessings in account':0,
  //                         // 'Typed Ram':0,
  //                         // 'Typed Ram Today':0,
  //                         // }),
  //                         print("Success"),
  //                         Navigator.pushReplacement(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => SignIn())),
  //                         Fluttertoast.showToast(msg: "Success")
  //                       })
  //             });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

// Future blessingsDetails()async{
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User? user = await FirebaseAuth.instance.currentUser;

//   try {
//     // await auth.createUserWithEmailAndPassword(email: emailController.text, password: phoneController.text).then((signedInUser) => {
//       FirebaseFirestore.instance.collection("Blessings").doc(user!.email).set({
//         'Total Blessings Earned':0,
//         'Blessings Earned today':0,
//         'Blessings in account':0,
//         'Typed Ram':0,
//         'Typed Ram Today':0,

//       }).then((signedInUser) => {
//         print("hello"),
//         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn())),
//        Fluttertoast.showToast(msg: "hello")
//       });
//     // });
//   } catch (e) {
//     print(e);
//   }
// }
}
