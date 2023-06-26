import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

class GoalAchieve extends StatelessWidget {
  final goall;
  final blessingsForGoalAchieve;
  // final variable2;

  GoalAchieve({
    this.goall,
    this.blessingsForGoalAchieve,
  });
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: SingleChildScrollView(
          child: Container(
            width: size.width * 1.2,
            // height: size.height * 2.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getVerticalSize(
                    562.00,
                  ),
                  width: size.width * 1.2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: size.width * 1.2,
                          padding: getPadding(
                            left: 59,
                            top: 32,
                            right: 59,
                            bottom: 32,
                          ),
                          decoration: AppDecoration.fillLime900.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderBR37,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 350,
                                child: Text(
                                  "Goal Reached!",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtLoraRomanSemiBold41030,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgPngegg1,
                                height: getSize(
                                  218.00,
                                ),
                                width: getSize(
                                  218.00,
                                ),
                                margin: getMargin(
                                  top: 51,
                                  bottom: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: getMargin(
                            left: 20,
                            right: 20,
                          ),
                          decoration: AppDecoration.fillYellow100.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder21,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 22,
                                ),
                                child: Text(
                                  "You typed",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLoraRomanSemiBold15,
                                ),
                              ),
                              Text(
                                goall,
                                // "108",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanSemiBold42,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 2,
                                ),
                                child: Text(
                                  "Ram",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLoraRomanSemiBold20,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  353.00,
                                ),
                                margin: getMargin(
                                  top: 16,
                                ),
                                padding: getPadding(
                                  left: 40,
                                  top: 14,
                                  right: 40,
                                  bottom: 14,
                                ),
                                decoration: AppDecoration.fillLime900.copyWith(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(21),
                                        bottomRight: Radius.circular(21))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "$blessingsForGoalAchieve blessings earned",
                                        // "10 blessings earned",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtLoraRomanSemiBold19,
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
                Container(
                  height: getVerticalSize(65),
                  width: getHorizontalSize(
                    343.00,
                  ),
                  margin: getMargin(
                    left: 25,
                    top: 50,
                    right: 25,
                    bottom: 5,
                  ),
                  padding: getPadding(
                    all: 5,
                  ),
                  decoration: AppDecoration.outlineLime900.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder29,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(52),
                        width: getHorizontalSize(
                          333.00,
                        ),
                        padding: getPadding(
                          left: 85,
                          top: 14,
                          right: 85,
                          bottom: 0,
                        ),
                        decoration: AppDecoration.fillLime900.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder29,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.chooseGoal);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Set New Goal",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanSemiBold16
                                    .copyWith(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 20,
                    left: 25,
                    right: 25,
                    bottom: 31,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.homeScreen);
                        },
                        height: 54,
                        width: size.width * 0.82,
                        text: "Back to Home",
                        variant: ButtonVariant.OutlineLime900_1,
                        shape: ButtonShape.CircleBorder24,
                        fontStyle: ButtonFontStyle.LoraRomanSemiBold18Yellow100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: Container(
        //   height: getVerticalSize(65),
        //   width: getHorizontalSize(
        //     343.00,
        //   ),
        //   margin: getMargin(
        //     left: 25,
        //     top: 50,
        //     right: 25,
        //     bottom: 5,
        //   ),
        //   padding: getPadding(
        //     all: 5,
        //   ),
        //   decoration: AppDecoration.outlineLime900.copyWith(
        //     borderRadius: BorderRadiusStyle.circleBorder29,
        //   ),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Container(
        //         height: getVerticalSize(52),
        //         width: getHorizontalSize(
        //           333.00,
        //         ),
        //         padding: getPadding(
        //           left: 85,
        //           top: 16,
        //           right: 85,
        //           bottom: 0,
        //         ),
        //         // decoration: AppDecoration.outlineLime900.copyWith(
        //         //   borderRadius: BorderRadiusStyle.circleBorder29,
        //         // ),
        //         child: GestureDetector(
        //           onTap: () {
        //             Navigator.pushReplacementNamed(
        //                 context, AppRoutes.homeScreen);
        //           },
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: [
        //               Text(
        //                 "Back To Home",
        //                 overflow: TextOverflow.ellipsis,
        //                 textAlign: TextAlign.left,
        //                 style: AppStyle.txtLoraRomanSemiBold16
        //                     .copyWith(fontSize: 18),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
