import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_title.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:bhaktiyoga_ios/widgets/custom_drop_down.dart';
import 'package:bhaktiyoga_ios/widgets/custom_text_form_field.dart';
import 'package:bhaktiyoga_ios/widgets/rounded_text_files.dart';
// ignore_for_file: must_be_immutable

class BankDetails extends StatefulWidget {
  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  TextEditingController bankNameController = TextEditingController();

  TextEditingController ifscCodeController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();

  TextEditingController panCardController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.gray900,
        resizeToAvoidBottomInset: true,
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
                text: "Bank Details", margin: getMargin(left: 24, top: 25))),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                  width: size.width * 1.2,
                  padding: getPadding(left: 20, top: 30, right: 20, bottom: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Please enter bank details matching the name in your profile. If there is mismatch in name or any error in your bank details - the payment will not be successful. You will not be able to edit this information in future without permission.",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanSemiBold12.copyWith(
                              fontSize: 14,
                              height: getVerticalSize(2.00),
                            ),
                          ),
                        ),
                        // CustomTextFormField(
                        //     width: 345,
                        //     focusNode: FocusNode(),
                        //     controller: bankNameController,
                        //     hintText: "Bank Name*"),
                        RoundedTextFormField(
                          labelText: "Bank Name*",
                          controller: bankNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _showError = true;
                              });
                              return 'Please enter name';
                            }
                            setState(() {
                              _showError = false;
                            });
                            return null;

                            // return null;
                          },
                        ),

                        Divider(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RoundedTextFormField(
                          // textInputType: TextInputType.text,
                          labelText: "IFSC Code*",
                          controller: ifscCodeController,

                          onChanged: (value) {
                            if (ifscCodeController.text.length != 11) {
                              Fluttertoast.showToast(
                                  msg: "Please enter a valid IFSC Code");
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your IFSC Code";
                            } else if (value.length != 11) {
                              return "Please enter a valid IFSC Code";
                            } else {
                              return null;
                            }
                          },
                        ),

                        Divider(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RoundedTextFormField(
                          labelText: "Account Number*",
                          controller: accountNumberController,
                          validator: (value) {
                            if (value!.length <= 3) {
                              return "Please enter your Account Number";
                            } else {
                              return null;
                            }
                          },
                        ),

                        Divider(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RoundedTextFormField(
                          labelText: "PAN Card*",
                          controller: panCardController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your IFSC Code";
                            } else if (value.length != 10) {
                              return "Please enter a valid PAN Card Number";
                            } else {
                              return null;
                            }
                          },
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
                                        if (bankNameController.text.isEmpty ||
                                            ifscCodeController.text.isEmpty ||
                                            panCardController.text.isEmpty ||
                                            accountNumberController
                                                .text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please Fill All the Deatils");
                                        } else {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            values();
                                            Navigator.pushNamed(context,
                                                AppRoutes.confirmDetails);
                                          }
                                        }
                                      },
                                      height: 48,
                                      width: 338,
                                      text: "Confirm Details",
                                      variant: ButtonVariant.OutlineLime900,
                                      shape: ButtonShape.CircleBorder24,
                                      padding: ButtonPadding.PaddingAll11,
                                      fontStyle: ButtonFontStyle
                                          .LoraRomanSemiBold18Yellow100)
                                ])),
                      ])),
            )));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;

  // Future<void> createCollectionIfNotExists() async {
  //   DocumentReference document =
  //       firestore.collection("Bank Details").doc(user!.email);
  //   DocumentSnapshot snapshot = await document.get();

  //   if (!snapshot.exists) {
  //     await firestore.collection("Bank Details").doc(user!.email).set({
  //       'Bank Name': bankNameController.text,
  //       'IFSC Code': ifscCodeController.text,
  //       'Account Number': accountNumberController.text,
  //       'PAN Card Number': panCardController.text,
  //       'Confirm Details': 0,
  //     });
  //   }
  // }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref =
          firestore.collection("Bank Details").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        // String bankName = (snapshot.data() as Map)['Bank Name'];
        // String ifscCode = (snapshot.data() as Map)['IFSC Code'];
        // String accoutntNumber = (snapshot.data() as Map)['Account Number'];
        // String panNumber = (snapshot.data() as Map)['PAN Card Number'];

        snapshot.reference.update({
          'Bank Name': bankNameController.text,
          'IFSC Code': ifscCodeController.text,
          'Account Number': accountNumberController.text,
          'PAN Card Number': panCardController.text,
          'Confirm Details': 0,
        });
        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore
        // setState(() {
        //   bankNameController.text = bankName;
        //   ifscCodeController.text = ifscCode;
        //   accountNumberController.text = accoutntNumber;
        //   panCardController.text = panNumber;

        //   // subStringuserFullName = userFullName.substring(0, 1).toUpperCase();

        //   // typedram=currentValue;
        //   // typedramtoday=trt;
        //   // blessingsearnedtoday=bet;
        // });
      });
    }
  }
}
