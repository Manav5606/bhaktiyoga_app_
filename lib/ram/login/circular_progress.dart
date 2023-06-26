import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
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
                  243.00,
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
              Container(
                width: getHorizontalSize(
                  349.00,
                ),
                margin: getMargin(
                  left: 2,
                ),
                padding: getPadding(
                  all: 5,
                ),
                // decoration: AppDecoration.outlineYellow100.copyWith(
                //   borderRadius: BorderRadiusStyle.circleBorder29,
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // child: Scaffold(
      //   backgroundColor: ColorConstant.gray900,
      //   appBar: AppBar(
      //     title: Text("Google Login",style: TextStyle(color: ColorConstant.yellow100),),
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
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CircularProgressIndicator(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
