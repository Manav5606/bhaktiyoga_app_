import 'package:bhaktiyoga_ios/ram/goal/custom_dialog.dart';
import 'package:bhaktiyoga_ios/ram/goal/write.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:volume_control/volume_control.dart';

class ChooseGoal extends StatefulWidget {
  @override
  State<ChooseGoal> createState() => _ChooseGoalState();
}

class _ChooseGoalState extends State<ChooseGoal> {
  final goals = [
    "108 RAM",
    "216 RAM",
    "1008 RAM",
    "SET",
  ];

  final blessing = [
    "1 Blessings",
    "2 Blessings",
    "10 Blessings",
    "Custom Goal",
  ];

  @override
  void initState() {
    super.initState();
    VolumeControl.setVolume(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        FocusScope.of(context).unfocus();
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width * 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 1.2,
                  padding: getPadding(
                    left: 62,
                    top: 14,
                    right: 62,
                    bottom: 14,
                  ),
                  decoration: AppDecoration.fillLime900.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderBR37,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgPngegg1,
                        height: getSize(
                          253.00,
                        ),
                        width: getSize(
                          253.00,
                        ),
                        margin: getMargin(top: 7, left: size.width * 0.03),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 38,
                  ),
                  child: Text(
                    "Choose your Goal",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtLoraRomanSemiBold3422.copyWith(
                      height: getVerticalSize(
                        1.00,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 22,
                    top: 29,
                    right: 23,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: getPadding(
                          left: 15,
                          top: 14,
                          right: 15,
                          bottom: 14,
                        ),
                        decoration: AppDecoration.outlineYellow100b2.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder21,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.015),
                                  child: Text(
                                    "108 RAM",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtLoraRomanMedium12.copyWith(
                                      height: getVerticalSize(
                                        1.00,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  child: Text(
                                    "1 Blessings",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtLoraRomanMedium18.copyWith(
                                      height: getVerticalSize(
                                        1.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CustomButton(
                              onTap: () {
                                // if (goals[index] == "SET") {
                                // showDialog(
                                //     context: context,
                                //     builder: (_) => AlertDialog(
                                //           content: CustomDialog(),
                                //           backgroundColor: Colors.transparent,
                                //         ));
                                // } else {
                                // Navigator.pushNamed(context, AppRoutes.write);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Write(
                                      goal: 108,
                                      blessingsForGoalAchieve: 1,
                                    ),
                                  ),
                                );
                              },
                              height: 30,
                              width: 85,
                              text: "Start now",
                              margin: getMargin(
                                top: 6,
                                bottom: 8,
                              ),
                              shape: ButtonShape.RoundedBorder9,
                            ),
                          ],
                        ),
                      ),
                      // Divider(
                      //   height: 10,
                      // ),
                      // Container(
                      //   padding: getPadding(
                      //     left: 15,
                      //     top: 14,
                      //     right: 15,
                      //     bottom: 14,
                      //   ),
                      //   decoration: AppDecoration.outlineYellow100b2.copyWith(
                      //     borderRadius: BorderRadiusStyle.circleBorder21,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Padding(
                      //             padding: EdgeInsets.only(
                      //                 top: MediaQuery.of(context).size.height *
                      //                     0.015),
                      //             child: Text(
                      //               "216 RAM",
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style:
                      //                   AppStyle.txtLoraRomanMedium12.copyWith(
                      //                 height: getVerticalSize(
                      //                   1.00,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: getPadding(
                      //               top: MediaQuery.of(context).size.height *
                      //                   0.02,
                      //             ),
                      //             child: Text(
                      //               "2 Blessings",
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style:
                      //                   AppStyle.txtLoraRomanMedium18.copyWith(
                      //                 height: getVerticalSize(
                      //                   1.00,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       CustomButton(
                      //         onTap: () {
                      //           // if (goals[index] == "SET") {
                      //           // showDialog(
                      //           //     context: context,
                      //           //     builder: (_) => AlertDialog(
                      //           //           content: CustomDialog(),
                      //           //           backgroundColor: Colors.transparent,
                      //           //         ));
                      //           // } else {
                      //           // Navigator.pushNamed(context, AppRoutes.write);
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => Write(
                      //                 goal: 216,
                      //                 blessingsForGoalAchieve: 2,
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         height: 30,
                      //         width: 85,
                      //         text: "Start now",
                      //         margin: getMargin(
                      //           top: 6,
                      //           bottom: 8,
                      //         ),
                      //         shape: ButtonShape.RoundedBorder9,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Divider(
                      //   height: 10,
                      // ),
                      // Container(
                      //   padding: getPadding(
                      //     left: 15,
                      //     top: 14,
                      //     right: 15,
                      //     bottom: 14,
                      //   ),
                      //   decoration: AppDecoration.outlineYellow100b2.copyWith(
                      //     borderRadius: BorderRadiusStyle.circleBorder21,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Padding(
                      //             padding: EdgeInsets.only(
                      //                 top: MediaQuery.of(context).size.height *
                      //                     0.015),
                      //             child: Text(
                      //               "1080 RAM",
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style:
                      //                   AppStyle.txtLoraRomanMedium12.copyWith(
                      //                 height: getVerticalSize(
                      //                   1.00,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: getPadding(
                      //               top: MediaQuery.of(context).size.height *
                      //                   0.02,
                      //             ),
                      //             child: Text(
                      //               "10 Blessings",
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style:
                      //                   AppStyle.txtLoraRomanMedium18.copyWith(
                      //                 height: getVerticalSize(
                      //                   1.00,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       CustomButton(
                      //         onTap: () {
                      //           // if (goals[index] == "SET") {
                      //           // showDialog(
                      //           //     context: context,
                      //           //     builder: (_) => AlertDialog(
                      //           //           content: CustomDialog(),
                      //           //           backgroundColor: Colors.transparent,
                      //           //         ));
                      //           // } else {
                      //           // Navigator.pushNamed(context, AppRoutes.write);
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => Write(
                      //                 goal: 1080,
                      //                 blessingsForGoalAchieve: 10,
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //         height: 30,
                      //         width: 85,
                      //         text: "Start now",
                      //         margin: getMargin(
                      //           top: 6,
                      //           bottom: 8,
                      //         ),
                      //         shape: ButtonShape.RoundedBorder9,
                      //       ),
                          // ],
                        // ),
                      // ),
                      // Divider(
                      //   height: 10,
                      // ),
                      // Container(
                      //   padding: getPadding(
                      //     left: 15,
                      //     top: 14,
                      //     right: 15,
                      //     bottom: 14,
                      //   ),
                      //   decoration: AppDecoration.outlineYellow100b2.copyWith(
                      //     borderRadius: BorderRadiusStyle.circleBorder21,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Padding(
                      //             padding: EdgeInsets.only(
                      //                 top: MediaQuery.of(context).size.height *
                      //                     0.015),
                      //             child: Text(
                      //               "SET",
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style:
                      //                   AppStyle.txtLoraRomanMedium12.copyWith(
                      //                 height: getVerticalSize(
                      //                   1.00,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: getPadding(
                      //               top: MediaQuery.of(context).size.height *
                      //                   0.02,
                      //             ),
                      //             child: Text(
                      //               "Custom Goal",
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style:
                      //                   AppStyle.txtLoraRomanMedium18.copyWith(
                      //                 height: getVerticalSize(
                      //                   1.00,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       CustomButton(
                      //         onTap: () {
                      //           showDialog(
                      //               context: context,
                      //               builder: (_) => AlertDialog(
                      //                     content: CustomDialog(),
                      //                     backgroundColor: Colors.transparent,
                      //                   ));
                      //         },
                      //         height: 30,
                      //         width: 85,
                      //         text: "Set now",
                      //         margin: getMargin(
                      //           top: 6,
                      //           bottom: 8,
                      //         ),
                      //         shape: ButtonShape.RoundedBorder9,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
