// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdProvider with ChangeNotifier {
//   late final InterstitialAd _interstitialAd;
//   final String _interstitialAdUnitId = "ca-app-pub-3940256099942544/1033173712";

//   InterstitialAd get interstitialAd => _interstitialAd;

//   AdProvider() {
//     _loadInterstitialAd();
//   }

//   void _loadInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: _interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           _interstitialAd = ad;
//           _setFullScreenContentCallback();
//           notifyListeners();
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           print("InterstitialAd failed to load: $error");
//         },
//       ),
//     );
//   }

//   void _setFullScreenContentCallback() {
//     _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         ad.dispose();
//         _loadInterstitialAd();
//       },
//     );
//   }
// }