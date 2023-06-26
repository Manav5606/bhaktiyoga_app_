import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/Service/splash_servcies.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

class HomeSplash extends StatefulWidget {
  @override
  State<HomeSplash> createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {
  SplashScreen splashScreen = SplashScreen();

  @override
  void initState() {
    super.initState();
    // splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: AppDecoration.outlineYellow100.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder29,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.googlesignin);
                    },
                    height: 48,
                    width: 338,
                    text: "Create Account",
                    variant: ButtonVariant.OutlineYellow100,
                    shape: ButtonShape.CircleBorder24,
                    padding: ButtonPadding.PaddingAll11,
                    fontStyle: ButtonFontStyle.LoraRomanSemiBold18,
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 27,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.googlesignin);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Use existing account",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLoraRomanSemiBold18.copyWith(
                        height: getVerticalSize(
                          1.00,
                        ),
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgVector,
                      height: getVerticalSize(
                        8.00,
                      ),
                      width: getHorizontalSize(
                        4.00,
                      ),
                      margin: getMargin(
                        left: 12,
                        top: 5,
                        bottom: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
