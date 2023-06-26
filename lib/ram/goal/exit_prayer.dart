import 'package:admob_flutter/admob_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/goal/write.dart';
import 'package:bhaktiyoga_ios/ram/home/home.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:volume_control/volume_control.dart';

// ignore_for_file: must_be_immutable
class ExitPrayer extends StatefulWidget {
  @override
  State<ExitPrayer> createState() => _ExitPrayerState();
}

class _ExitPrayerState extends State<ExitPrayer> {
  late AdmobInterstitial _admobInterstitial;

  // late final InterstitialAd interstitialAd;
  final String interstitialAdUnitId = "ca-app-pub-8085436041467199/1939622224";
  // // TODO: Implement _loadInterstitialAd()

  @override
  void initState() {
    // TODO: implement initState
    // _loadInterstitialAd();
    _admobInterstitial = createAdvert();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // interstitialAd.dispose();
    super.dispose();
  }

  AdmobInterstitial createAdvert() {
    return AdmobInterstitial(
      adUnitId: interstitialAdUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.loaded) {
          _admobInterstitial.show();
        } else if (event == AdmobAdEvent.closed) {
          _admobInterstitial.dispose();
          Navigator.pushReplacementNamed(context, '/home_screen');
        } else if (event == AdmobAdEvent.failedToLoad) {
          _admobInterstitial.dispose();
          Navigator.pushReplacementNamed(context, '/home_screen');
        }
      },
    );
  }

  // void _loadInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: interstitialAdUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback:
  //         InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
  //       //keep a reference to the ad as you can show it later
  //       interstitialAd = ad;

  //       //set on full screen content call back
  //       _setFullScreenContentCallback();
  //     }, onAdFailedToLoad: (LoadAdError loadAdError) {
  //       //ad failed to load
  //       print("Interstitial ad failed to load: $loadAdError");
  //     }),
  //   );
  // }
  // void _loadInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: interstitialAdUnitId,
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (ad) {
  //             Navigator.pushReplacementNamed(context, '/home_screen');
  //           },
  //         );

  //         setState(() {
  //           interstitialAd = ad;
  //         });
  //       },
  //       onAdFailedToLoad: (err) {
  //         print('Failed to load an interstitial ad: ${err.message}');
  //       },
  //     ),
  //   );
  // }

  //method to set show content call back
  // void _setFullScreenContentCallback() {
  //   interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (InterstitialAd ad) =>
  //         print("$ad onAdShowedFullScreenContent"),
  //     onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //       print("$ad onAdDismissedFullScreenContent");

  //       //dispose the dismissed ad
  //       ad.dispose();
  //     },
  //     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //       print("$ad  onAdFailedToShowFullScreenContent: $error ");
  //       //dispose the failed ad
  //       ad.dispose();
  //     },
  //     onAdImpression: (InterstitialAd ad) => print("$ad Impression occured"),
  //   );
  // }

  // //show ad method
  // void _showInterstitialAd() {
  //   if (interstitialAd == null) {
  //     print("Ad not ready!");
  //     return;
  //   }
  //   interstitialAd.show();
  // }

  @override
  Widget build(BuildContext context) {
    // _loadInterstitialAd();
    return Container(
      // width: 1000,
      padding: getPadding(
        left: 10,
        top: 23,
        right: 10,
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
              384.00,
            ),
            margin: getMargin(
              top: 5,
            ),
            child: Text(
              "Do you want to end this prayer ? ",
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
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
                      width: getHorizontalSize(118),
                      padding: getPadding(
                          // all: 3,
                          top: 3,
                          bottom: 3),
                      decoration: AppDecoration.outline.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder21,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getVerticalSize(35),
                            width: getHorizontalSize(
                              120.00,
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
                                      "Back to typing",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtLoraRomanSemiBold1284
                                          .copyWith(fontSize: 13),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            // VolumeControl.setVolume(0.0);
                            // Navigator.of(context).popUntil(ModalRoute.withName('/'));
                            Navigator.of(context)
                                .pushNamed(AppRoutes.homeScreen);
                            await AudioService().stop();
                            _admobInterstitial.load();
                            // await Future.delayed(Duration(milliseconds: 100));
                            Navigator.of(context)
                                .pushNamed(AppRoutes.homeScreen);
                          },
                          child: Container(
                            width: getHorizontalSize(
                              70.00,
                            ),
                            padding: getPadding(
                              left: 18,
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
                                  ),
                                  child: Text(
                                    "Yes",
                                    // overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLoraRomanSemiBold18,
                                  ),
                                ),
                              ],
                            ),
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
//  await AudioService().stop();
                                      // _admobInterstitial.load();