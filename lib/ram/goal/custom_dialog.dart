import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/goal/write.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:bhaktiyoga_ios/widgets/rounded_text_files.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CustomDialog extends StatefulWidget {
  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController frameThirtyThreeController = TextEditingController();

  late int blessings;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 42,
        top: 26,
        right: 42,
        bottom: 26,
      ),
      decoration: AppDecoration.outlineYellow100b21.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder21,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              top: 1,
            ),
            child: Column(
              children: [
                Text(
                  "Set Custom",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLoraRomanSemiBold24.copyWith(
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
                Text(
                  "Goal",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLoraRomanSemiBold24.copyWith(
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // CustomTextFormField(

          //     width: 345,
          //     focusNode: FocusNode(),
          //     controller: frameThirtyThreeController,
          //     onChanged: (value) {
          //       // setState(() {
          //         frameThirtyThreeController.text = value;
          //       // });
          //     },
          //     hintText: "Set Custom Goal",
          //     margin: getMargin(top: 24),
          //     textInputType: TextInputType.phone,

          //     ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 10),
            child: RoundedTextFormField(
              labelText: "Set Custom Goal",
              controller: frameThirtyThreeController,
              textInputType: TextInputType.number,
              onChanged: (value) {
                if (frameThirtyThreeController.text.isNotEmpty &&
                    frameThirtyThreeController.text.length < 5) {
                  setState(() {
                    // frameThirtyThreeController.text = value;
                    blessings = int.parse(value);
                    result = blessings ~/ 108;
                  });
                } else {
                  Fluttertoast.showToast(
                      msg: "Number Should Be Less Than 5 digitis");
                  setState(() {
                    result = 0;
                  });
                }
              },
            ),
            // child: TextFormField(
            // controller: frameThirtyThreeController,
            //  keyboardType: TextInputType.number,
            // onChanged: (value) {
            //   if(frameThirtyThreeController.text.isNotEmpty){
            //   setState(() {
            //     frameThirtyThreeController.text = value;
            //     blessings=int.parse(frameThirtyThreeController.text);
            //     result = blessings~/108;
            //   });
            //   }
            //   else{
            //     setState(() {
            //       result=0;
            //     });
            //   }
            // },

            // decoration: InputDecoration(
            //   hintText: "Set Custom Goal",
            //   hintStyle: AppStyle.txtLoraRomanRegular16.copyWith(
            //     color: Colors.brown,
            //   ),
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(28),
            //     borderSide: BorderSide(
            //       color: Colors.brown,
            //     ),
            //   ),
            //   enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(28),
            //     borderSide: BorderSide(
            //       color: Colors.brown,
            //     ),
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(28),
            //     borderSide: BorderSide(
            //       color: Colors.brown,
            //     ),
            //   ),
            // ),
            // ),
          ),
          Padding(
            padding: getPadding(
              top: 13,
            ),
            child: Text(
              "$result Blessings",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtLoraRomanMedium14.copyWith(
                height: getVerticalSize(
                  1.00,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (frameThirtyThreeController.text.isNotEmpty) {
                if (int.parse(frameThirtyThreeController.text) >= 108) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Write(
                        goal: int.parse(frameThirtyThreeController.text),
                        blessingsForGoalAchieve: result,
                      ),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "Please Enter Goal Bigger Than 108");
                }
              } else {
                Fluttertoast.showToast(msg: "Please Enter Goal");
              }
              // Navigator.pushNamed(context, AppRoutes.write);
            },
            child: Container(
              width: getHorizontalSize(349.00),
              margin: getMargin(left: 4, top: 39),
              padding: getPadding(all: 5),
              decoration: AppDecoration.outlineLime900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder29),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                      height: 48,
                      width: 338,
                      text: "Start Now",
                      variant: ButtonVariant.OutlineLime900,
                      shape: ButtonShape.CircleBorder24,
                      padding: ButtonPadding.PaddingAll11,
                      fontStyle: ButtonFontStyle.LoraRomanSemiBold18Yellow100)
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: getPadding(
          //     left: 41,
          //     top: 30,
          //     right: 42,
          //   ),
          //   // child: OutlineGradientButton(
          //   //   padding: EdgeInsets.only(
          //   //     left: getHorizontalSize(
          //   //       1.00,
          //   //     ),
          //   //     top: getVerticalSize(
          //   //       1.00,
          //   //     ),
          //   //     right: getHorizontalSize(
          //   //       1.00,
          //   //     ),
          //   //     bottom: getVerticalSize(
          //   //       1.00,
          //   //     ),
          //   //   ),
          //   //   strokeWidth: getHorizontalSize(
          //   //     1.00,
          //   //   ),
          //   //   gradient: LinearGradient(
          //   //     begin: Alignment(
          //   //       0.06,
          //   //       0,
          //   //     ),
          //   //     end: Alignment(
          //   //       1,
          //   //       0.9,
          //   //     ),
          //   //     colors: [
          //   //       ColorConstant.lime900,
          //   //       ColorConstant.gray900,
          //   //     ],
          //   //   ),
          //   //   corners: Corners(
          //   //     topLeft: Radius.circular(
          //   //       26,
          //   //     ),
          //   //     topRight: Radius.circular(
          //   //       26,
          //   //     ),
          //   //     bottomLeft: Radius.circular(
          //   //       26,
          //   //     ),
          //   //     bottomRight: Radius.circular(
          //   //       26,
          //   //     ),
          //   //   ),
          //   //   child: Container(
          //   //     width: getHorizontalSize(
          //   //       184.00,
          //   //     ),
          //   //     padding: getPadding(
          //   //       left: 2,
          //   //       top: 4,
          //   //       right: 2,
          //   //       bottom: 4,
          //   //     ),
          //   //     decoration: AppDecoration.outline.copyWith(
          //   //       borderRadius: BorderRadiusStyle.circleBorder24,
          //   //     ),
          //   //     child: Column(
          //   //       mainAxisSize: MainAxisSize.min,
          //   //       mainAxisAlignment: MainAxisAlignment.start,
          //   //       children: [
          //   //         Container(
          //   //           width: getHorizontalSize(
          //   //             178.00,
          //   //           ),
          //   //           padding: getPadding(
          //   //             left: 47,
          //   //             top: 9,
          //   //             right: 47,
          //   //             bottom: 9,
          //   //           ),
          //   //           decoration: AppDecoration.fillLime900.copyWith(
          //   //             borderRadius: BorderRadiusStyle.circleBorder21,
          //   //           ),
          //   //           child: Column(
          //   //             mainAxisSize: MainAxisSize.min,
          //   //             mainAxisAlignment: MainAxisAlignment.start,
          //   //             children: [
          //   //               Text(
          //   //                 "Start now",
          //   //                 overflow: TextOverflow.ellipsis,
          //   //                 textAlign: TextAlign.left,
          //   //                 style: AppStyle.txtLoraRomanSemiBold18.copyWith(
          //   //                   height: getVerticalSize(
          //   //                     1.00,
          //   //                   ),
          //   //                 ),
          //   //               ),
          //   //             ],
          //   //           ),
          //   //         ),
          //   //       ],
          //   //     ),
          //   //   ),
          //   // ),
          // ),
        ],
      ),
    );
  }
}
