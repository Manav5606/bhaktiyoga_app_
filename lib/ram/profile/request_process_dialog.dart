import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore_for_file: must_be_immutable
class RequestProcessDialog extends StatelessWidget {
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
              "Your change request will be processed within 24-48 hours. ",
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
            child: OutlineGradientButton(
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
                        130.00,
                      ),
                      padding: getPadding(
                        left: 18,
                        top: 3,
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
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Okay",
                                // overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanSemiBold18,
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
          ),
        ],
      ),
    );
  }
}
