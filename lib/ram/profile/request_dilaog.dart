import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore_for_file: must_be_immutable
class RequestDialog extends StatefulWidget {
  @override
  State<RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 20,
        top: 23,
        right: 20,
        bottom: 23,
      ),
      decoration: AppDecoration.outlineYellow100b21.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder21,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: getHorizontalSize(
              284.00,
            ),
            margin: getMargin(
              top: 5,
            ),
            child: Text(
              "Do you want to request a change in your personal details? ",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtLoraRomanSemiBold24,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 44,
              right: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineGradientButton(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      1.00,
                    ),
                    top: getVerticalSize(
                      1.00,
                    ),
                    right: getHorizontalSize(
                      1.00,
                    ),
                    bottom: getVerticalSize(
                      1.00,
                    ),
                  ),
                  strokeWidth: getHorizontalSize(
                    1.00,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(
                      0.06,
                      0,
                    ),
                    end: Alignment(
                      1,
                      0.9,
                    ),
                    colors: [
                      ColorConstant.lime900,
                      ColorConstant.gray900,
                    ],
                  ),
                  corners: Corners(
                    topLeft: Radius.circular(
                      26,
                    ),
                    topRight: Radius.circular(
                      26,
                    ),
                    bottomLeft: Radius.circular(
                      26,
                    ),
                    bottomRight: Radius.circular(
                      26,
                    ),
                  ),
                  child: Container(
                    padding: getPadding(
                      all: 3,
                    ),
                    decoration: AppDecoration.outline.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder21,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: getHorizontalSize(
                            70.00,
                          ),
                          padding: getPadding(
                            left: 5,
                            top: 2,
                            right: 5,
                            bottom: 4,
                          ),
                          decoration: AppDecoration.fillYellow100.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder21,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 4,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    // overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLoraRomanSemiBold1284
                                        .copyWith(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlineGradientButton(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      1.00,
                    ),
                    top: getVerticalSize(
                      1.00,
                    ),
                    right: getHorizontalSize(
                      1.00,
                    ),
                    bottom: getVerticalSize(
                      1.00,
                    ),
                  ),
                  strokeWidth: getHorizontalSize(
                    1.00,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(
                      0.06,
                      0,
                    ),
                    end: Alignment(
                      1,
                      0.9,
                    ),
                    colors: [
                      ColorConstant.lime900,
                      ColorConstant.gray900,
                    ],
                  ),
                  corners: Corners(
                    topLeft: Radius.circular(
                      26,
                    ),
                    topRight: Radius.circular(
                      26,
                    ),
                    bottomLeft: Radius.circular(
                      26,
                    ),
                    bottomRight: Radius.circular(
                      26,
                    ),
                  ),
                  child: Container(
                    padding: getPadding(
                      all: 5,
                    ),
                    decoration: AppDecoration.outline.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder21,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: getHorizontalSize(
                            MediaQuery.of(context).size.width * 0.25,
                          ),
                          padding: getPadding(
                            left: 8,
                            top: 4,
                            right: 18,
                            bottom: 7,
                          ),
                          decoration: AppDecoration.fillLime900.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder21,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 4,
                                  // left: 10
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).popUntil(ModalRoute.withName('/'));
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.requestChanges);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Text(
                                      "Request",
                                      // overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtLoraRomanSemiBold18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
