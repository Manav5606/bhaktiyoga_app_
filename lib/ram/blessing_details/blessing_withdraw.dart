import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

class BlessingWithdraw extends StatefulWidget {
  @override
  State<BlessingWithdraw> createState() => _BlessingWithdrawState();
}

class _BlessingWithdrawState extends State<BlessingWithdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      body: Container(
        width: size.width * 1.2,
        padding: getPadding(
          left: 30,
          top: 60,
          right: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getHorizontalSize(
                304.00,
              ),
              child: Text(
                "You are about to withdraw your blessings",
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtLoraRomanSemiBold24Yellow100.copyWith(
                  height: getVerticalSize(
                    1.17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 1,
                top: 31,
                right: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: getPadding(
                      left: 31,
                      top: 17,
                      right: 31,
                      bottom: 17,
                    ),
                    decoration: AppDecoration.outlineYellow100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: Text(
                            "Blessings",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanSemiBold10Yellow100
                                .copyWith(
                              height: getVerticalSize(
                                1.00,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "1000",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanSemiBold2731Yellow100
                                .copyWith(
                              height: getVerticalSize(
                                1.00,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 19,
                      bottom: 19,
                    ),
                    child: Text(
                      "=",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLoraRomanMedium3457.copyWith(
                        height: getVerticalSize(
                          1.00,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: getPadding(
                      left: 42,
                      top: 17,
                      right: 42,
                      bottom: 17,
                    ),
                    decoration: AppDecoration.outlineYellow100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Amount",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.txtLoraRomanSemiBold10Yellow100.copyWith(
                            height: getVerticalSize(
                              1.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "₹ 1000",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLoraRomanSemiBold2731Yellow100
                                  .copyWith(
                                height: getVerticalSize(
                                  1.00,
                                ),
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
            Container(
              width: getHorizontalSize(
                255.00,
              ),
              margin: getMargin(
                top: 37,
              ),
              child: Text(
                "Once you click on withdraw your request will be sent Bhaktiyoga team and you can’t withdraw your request.",
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtLoraRomanMedium12.copyWith(
                  height: getVerticalSize(
                    1.17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 35,
                right: 1,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      "Cancel",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLoraRomanSemiBold16.copyWith(
                        height: getVerticalSize(
                          1.00,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: getPadding(
                      left: 3,
                      top: 5,
                      right: 3,
                      bottom: 5,
                    ),
                    decoration: AppDecoration.outlineLime900.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder29,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomButton(
                          height: 48,
                          width: 215,
                          text: "Withdraw",
                          variant: ButtonVariant.FillLime900,
                          shape: ButtonShape.CircleBorder24,
                          padding: ButtonPadding.PaddingAll11,
                          fontStyle:
                              ButtonFontStyle.LoraRomanSemiBold18Yellow100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
