import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/Service/splash_servcies.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:volume_control/volume_control.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashScreen splashScreen = SplashScreen();

  @override
  void initState() {
    super.initState();
    VolumeControl.setVolume(0.0);
    splashScreen.isLogin(context);
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
            SingleChildScrollView(
              child: Container(
                height: getVerticalSize(
                  263.00,
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
                          "BHAKTIYOGA",
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
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
