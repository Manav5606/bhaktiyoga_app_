import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/bankdetails/withdrawn_success.dart';
import 'package:bhaktiyoga_ios/ram/profile/user_profile.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_title.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:bhaktiyoga_ios/widgets/custom_drop_down.dart';
import 'package:bhaktiyoga_ios/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

import '../../widgets/rounded_text_files.dart';
// ignore_for_file: must_be_immutable

class ConfirmDetails extends StatefulWidget {
  @override
  State<ConfirmDetails> createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  TextEditingController bankNameController = TextEditingController();

  TextEditingController ifscCodeController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();

  TextEditingController panCardController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int withdrawone = 0;
  int totalBlessingInAccount = 0;
  int withdrawlAmountForNextPage = 0;
  int witdrawcount = 0;
  String userFullName = "";
  String userEmail = "";
  String userPhone = "";
  String userBankname = "";
  String userIfscCode = "";
  String userAccountNumber = "";
  String userPanCard = "";

  @override
  void initState() {
    // TODO: implement initState
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => values());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.blessingDetails);
        FocusScope.of(context).unfocus();
        return false;
      },
      child: Scaffold(
          backgroundColor: ColorConstant.gray900,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
              height: getVerticalSize(96.00),
              leadingWidth: 29,
              leading: AppbarImage(
                  height: getVerticalSize(15.00),
                  width: getHorizontalSize(8.00),
                  svgPath: ImageConstant.imgArrowleftYellow100,
                  margin: getMargin(left: 21, top: 20, bottom: 20),
                  onTap: () => onTapArrowleft(context)),
              title: AppbarTitle(
                  text: "Confirm Details",
                  margin: getMargin(left: 24, top: 25))),
          body: Form(
              key: _formKey,
              child: Container(
                  width: size.width * 1.2,
                  padding: getPadding(left: 20, top: 30, right: 20, bottom: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Please confirm your bank details shown below before clicking on the “Withdraw” button. You won’t be able to edit this information in the future. You can press the back button on top-left to go to previous step and edit your bank details.",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanSemiBold12.copyWith(
                              fontSize: 14,
                              height: getVerticalSize(2.00),
                            ),
                          ),
                        ),
                        RoundedTextFormField(
                          labelText: "Bank Name*",
                          controller: bankNameController,
                          enable: false,
                        ),

                        Divider(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RoundedTextFormField(
                          // textInputType: TextInputType.text,
                          labelText: "IFSC Code*",
                          controller: ifscCodeController,
                          enable: false,
                        ),

                        Divider(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RoundedTextFormField(
                          labelText: "Account Number*",
                          controller: accountNumberController,
                          enable: false,
                        ),

                        Divider(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RoundedTextFormField(
                          labelText: "PAN Card*",
                          controller: panCardController,
                          enable: false,
                        ),

                        Container(
                            width: getHorizontalSize(349.00),
                            margin: getMargin(left: 4, top: 39),
                            padding: getPadding(all: 5),
                            decoration: AppDecoration.outlineLime900.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder29),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomButton(
                                      onTap: () {
                                        update();
                                        if (withdrawone == 0 &&
                                            totalBlessingInAccount >= 2) {
                                          updateBlessingsInAccount();
                                          updateWithdrawStatusOne();
                                          // email();
                                          newEmail();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WithdrawSuccess(
                                                withdrawnAmount:
                                                    withdrawlAmountForNextPage,
                                              ),
                                            ),
                                          );
                                        } else if (withdrawone == 1 &&
                                            totalBlessingInAccount >= 1080) {
                                          updateBlessingsInAccount();
                                          // email();
                                          newEmail();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WithdrawSuccess(
                                                withdrawnAmount:
                                                    withdrawlAmountForNextPage,
                                              ),
                                            ),
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Minimum 1080 Blessings needed to withdraw");
                                        }
                                      },
                                      height: 48,
                                      width: 338,
                                      text: "Withdraw",
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
                        //       padding: getPadding(top: 27, bottom: 5),
                        //       child: Text("Already have an account? Login",
                        //           overflow: TextOverflow.ellipsis,
                        //           textAlign: TextAlign.left,
                        //           style: AppStyle.txtLoraRomanSemiBold16
                        //               .copyWith(
                        //                   height: getVerticalSize(1.00)))),
                        // )
                      ])))),
    );
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  Future newEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url,
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          "service_id": "service_nzfxs7r",
          "template_id": "template_0etvtyh",
          "user_id": "user_TFTcuw8fUi9S6SHIO",
          "template_params": {
            "subject": "User Info",
            "user_email": "manavpatel528@gmail.com",
            "name": userFullName,
            "message": "You have successfully withdrawn your blessings",
          }
        }));
    return response.statusCode;
  }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref =
          firestore.collection("Bank Details").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        String bankName = (snapshot.data() as Map)['Bank Name'];
        String ifscCode = (snapshot.data() as Map)['IFSC Code'];
        String accoutntNumber = (snapshot.data() as Map)['Account Number'];
        String panNumber = (snapshot.data() as Map)['PAN Card Number'];

        setState(() {
          bankNameController.text = bankName;
          ifscCodeController.text = ifscCode;
          accountNumberController.text = accoutntNumber;
          panCardController.text = panNumber;

          userBankname = bankName;
          userIfscCode = ifscCode;
          userAccountNumber = accoutntNumber;
          userPanCard = panNumber;
        });
      });

      DocumentReference withdraw =
          firestore.collection("Users").doc(user.email);
      withdraw.get().then((DocumentSnapshot snapshot) {
        String fullname = (snapshot.data() as Map)['Fullname'];
        String email = (snapshot.data() as Map)['Email'];
        String phone = (snapshot.data() as Map)['Phone'];
        int withdraw = (snapshot.data() as Map)['Withdraw'];

        setState(() {
          withdrawone = withdraw;

          fullNameUser = fullname;
          emailUser = email;
          phoneUser = phone;
        });
      });

      DocumentReference blessings =
          firestore.collection("bless").doc(user.email);
      blessings.get().then((DocumentSnapshot snapshot) {
        int blessingaccountUser =
            (snapshot.data() as Map)['Blessings in account'];
        int count = (snapshot.data() as Map)['count'];

        setState(() {
          totalBlessingInAccount = blessingaccountUser;
          withdrawlAmountForNextPage = blessingaccountUser;
          witdrawcount = count;
        });
      });
    }
  }

  void updateBlessingsInAccount() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      if (witdrawcount == null) {
        witdrawcount = 0;
      }
      DocumentReference ref = firestore.collection("bless").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        snapshot.reference.update({
          'Blessings in account': 0,
          'Withdraw_Amount_$witdrawcount': withdrawlAmountForNextPage,
          'withdraw_time_$witdrawcount': DateTime.now(),
          'count': witdrawcount + 1,
          'withdrawn_status': "pending",
          'withdrawn_status_$witdrawcount': "pending",
        });
      });
    }
  }

  void updateWithdrawStatusOne() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        snapshot.reference.update({
          'Withdraw': 1,
        });
      });
    }
  }

  void email() async {
    final Email email = Email(
      body: '<h1>User Info</h1>' +
          '<p><strong>Name:</strong> ' +
          userFullName +
          '</p>' +
          '<p><strong>Email:</strong> ' +
          userEmail +
          '</p>',
      // body: 'Name'+userFullName,
      subject: 'User Info',
      recipients: ['manavpatel528@gmail.com'],
      isHTML: true,
    );

    try {
      await FlutterEmailSender.send(email);
      Fluttertoast.showToast(msg: "Email sent successfully");
    } catch (error) {
      Fluttertoast.showToast(msg: "Failed to send email");
    }
  }

  void update() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref =
          firestore.collection("Bank Details").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        snapshot.reference.update({
          'Confirm Details': 1,
        });
      });
    }
  }
}
