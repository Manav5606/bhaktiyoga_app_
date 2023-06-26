// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/goal/exit_prayer.dart';
import 'package:bhaktiyoga_ios/ram/goal/goal_achieved.dart';
import 'package:bhaktiyoga_ios/ram/home/home.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'package:im_animations/im_animations.dart';
import 'package:volume_control/volume_control.dart';
import 'package:audioplayers/audioplayers.dart';

import 'dart:math';
import '../../widgets/custom_text_form_field.dart';

// class Write extends StatefulWidget {
//   @override
//   State<Write> createState() => _WriteState();
// }

// class _WriteState extends State<Write> {
//   TextEditingController frameThirtyThreeController = TextEditingController();

//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConstant.gray900,
//         appBar: CustomAppBar(
//           height: getVerticalSize(
//             56.00,
//           ),
//           leadingWidth: 48,
//           leading: AppbarImage(
//             height: getSize(
//               25.00,
//             ),
//             width: getSize(
//               25.00,
//             ),
//             svgPath: ImageConstant.imgVolume,
//             margin: getMargin(
//               left: 23,
//               top: 15,
//               bottom: 15,
//             ),
//           ),
//           centerTitle: true,
//           title: CustomButton(
//             height: 32,
//             width: 100,
//             text: "$count/108",
//             padding: ButtonPadding.PaddingT5,
//             fontStyle: ButtonFontStyle.LoraRomanSemiBold14Gray900,
//             prefixWidget: Container(
//               margin: getMargin(
//                 right: 8,
//               ),
//               child: CustomImageView(
//                 svgPath: ImageConstant.imgDashboard,
//               ),
//             ),
//           ),
//           actions: [
//             AppbarImage(
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                           content: ExitPrayer(),
//                           backgroundColor: Colors.transparent,
//                         ));
//               },
//               height: getSize(
//                 27.00,
//               ),
//               width: getSize(
//                 27.00,
//               ),
//               svgPath: ImageConstant.imgVolumeYellow100,
//               margin: getMargin(
//                 left: 17,
//                 top: 14,
//                 right: 17,
//                 bottom: 14,
//               ),
//             ),
//           ],
//         ),
//         body: Container(
//           width: size.width,
//           padding: getPadding(
//             left: 42,
//             top: 14,
//             right: 42,
//             bottom: 14,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: getSize(
//                   296.00,
//                 ),
//                 width: getSize(
//                   296.00,
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Container(
//                         height: getSize(
//                           269.00,
//                         ),
//                         width: getSize(
//                           269.00,
//                         ),
//                         margin: getMargin(
//                           right: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           color: ColorConstant.gray700,
//                           borderRadius: BorderRadius.circular(
//                             getHorizontalSize(
//                               134.00,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     CustomImageView(
//                       imagePath: ImageConstant.imgPngegg1,
//                       height: getSize(
//                         296.00,
//                       ),
//                       width: getSize(
//                         296.00,
//                       ),
//                       alignment: Alignment.center,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Center(
//                   child: CustomTextFormField(
//                     width: 250,
//                     focusNode: FocusNode(),
//                     controller: frameThirtyThreeController,
//                     hintText: "Start Typing RAM",
//                     onChanged: (value) {
//                       // frameThirtyThreeController.text=
//                       print(value);

//                       if (value == "RAM") {
//                         setState(() {
//                           count++;
//                         });
//                         Future.delayed(Duration(milliseconds: 500), () {
//                           frameThirtyThreeController.clear();
//                         });
//                       }
//                     },
//                     textInputType: TextInputType.text,
//                     textInputAction: TextInputAction.next,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class _WriteState extends State<Write> with SingleTickerProviderStateMixin {
  final goal;
  final blessingsForGoalAchieve;
  late AnimationController _controller;
  late Animation _animation;
  String _text = '';
  late int _randomX;
  late int _randomY;
  TextEditingController frameThirtyThreeController = TextEditingController();
  @override
  bool get wantKeepAlive => true;
  int count = 0;
  int typedRamCount = 0;
  int totalblessingsearned = 0;
  int totalblessingsearned2 = 0;
  int blessingsearnedtoday = 0;
  int blessinginaccount = 0;
  bool _isVolume = true;
  late AdmobInterstitial _admobInterstitial;

  final String interstitialAdUnitId = "ca-app-pub-8085436041467199/2133179444";

  _WriteState(this.goal, this.blessingsForGoalAchieve);
  @override
  void initState() {
    _admobInterstitial = createAdvert();
    super.initState();

    // AudioService().play();
    VolumeControl.setVolume(0.8);

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _randomX = Random().nextInt(2) == 0 ? -1 : 1;
            _randomY = Random().nextInt(2) == 0 ? -1 : 1;
          });
          _controller.repeat();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _randomX = Random().nextInt(2) == 0 ? -1 : 1;
    _randomY = Random().nextInt(2) == 0 ? -1 : 1;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  AdmobInterstitial createAdvert() {
    return AdmobInterstitial(
      adUnitId: interstitialAdUnitId,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.loaded) {
          _admobInterstitial.show();
        } else if (event == AdmobAdEvent.closed) {
          _admobInterstitial.dispose();
          // Navigator.pushReplacementNamed(context, '/home_screen');
        }
      },
    );
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // AudioService().play();
    // AudioService().play();
    return WillPopScope(
      onWillPop: () async {
        VolumeControl.setVolume(0.0);
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: ExitPrayer(),
                  backgroundColor: Colors.transparent,
                ));
        FocusScope.of(context).unfocus();
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        appBar: CustomAppBar(
          height: getVerticalSize(
            56.00,
          ),
          leadingWidth: 48,
          leading: AppbarImage(
            onTap: () async {
              if (!AudioService()._isPlaying) {
                // AudioService()._isPlaying == true;
                await AudioService().play();
              } else {
                // AudioService()._isPlaying == false;
                await AudioService().stop();
              }
              setState(() {
                _isVolume = !_isVolume;
              });
            },
            height: getSize(
              25.00,
            ),
            width: getSize(
              25.00,
            ),
            svgPath: _isVolume
                ? ImageConstant.imgVolumeOff
                : ImageConstant.imgVolume,
            margin: getMargin(
              left: 23,
              top: 15,
              bottom: 15,
            ),
          ),
          centerTitle: true,
          title: CustomButton(
            height: 32,
            width: 100,
            text: "$count/$goal",
            padding: ButtonPadding.PaddingT5,
            fontStyle: ButtonFontStyle.LoraRomanSemiBold14Gray900,
            prefixWidget: Container(
              margin: getMargin(
                right: 8,
              ),
              child: CustomImageView(
                svgPath: ImageConstant.imgDashboard,
              ),
            ),
          ),
          actions: [
            AppbarImage(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: ExitPrayer(),
                          backgroundColor: Colors.transparent,
                        ));
              },
              height: getSize(
                27.00,
              ),
              width: getSize(
                27.00,
              ),
              svgPath: ImageConstant.imgVolumeYellow100,
              margin: getMargin(
                left: 17,
                top: 14,
                right: 17,
                bottom: 14,
              ),
            ),
          ],
        ),
        body: Container(
          width: size.width * 1.2,
          // color: Colors.red,
          height: size.height * 1.2,
          padding: getPadding(
            left: 42,
            top: 24,
            right: 42,
            bottom: 14,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getSize(
                    270.00,
                  ),
                  width: getSize(
                    296.00,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: getSize(
                            269.00,
                          ),
                          width: getSize(
                            269.00,
                          ),
                          margin: getMargin(
                            right: 6,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                134.00,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ColorSonar(
                        // contentAreaColor: Colors.red,
                        innerWaveColor: Colors.redAccent,
                        middleWaveColor: Color.fromARGB(255, 255, 121, 111),
                        outerWaveColor: Color.fromARGB(255, 251, 166, 160),
                        contentAreaRadius: 60.0,
                        waveFall: 30.0,
                        // waveMotion: WaveMotion.synced,
                        duration: Duration(seconds: 6),
                        waveMotionEffect: Curves.easeOutSine,

                        child: CustomImageView(
                          imagePath: ImageConstant.imgPngegg1,
                          height: getSize(
                            296.00,
                          ),
                          width: getSize(
                            296.00,
                          ),
                          alignment: Alignment.center,
                          // margin: getMargin(
                          //   bottom: 100,
                          // ),
                        ),
                      ),
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgPngegg1,
                      //   height: getSize(
                      //     296.00,
                      //   ),
                      //   width: getSize(
                      //     296.00,
                      //   ),
                      //   alignment: Alignment.center,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0).copyWith(top: 50),
                  child: Center(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            // color: Colors.red,
                            height: 50,
                            width: 350,
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                // WhitelistingTextInputFormatter(RegExp("[A-Z]+"))
                                // UpperCaseTextInputFormatter(),
                              ],
                              style: TextStyle(color: ColorConstant.red200),
                              controller: frameThirtyThreeController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              // obscureText: false,

                              autocorrect: false,
                              enableInteractiveSelection: false,
                              onChanged: (value) {
                                // frameThirtyThreeController.text=
                                // print(value);
                                setState(() {
                                  _text = value;
                                  // frameThirtyThreeController.text = _text;
                                  frameThirtyThreeController.selection =
                                      TextSelection.collapsed(
                                          offset: _text.length);
                                  if (_text == "RAM") {
                                    count = count + 1;
                                    blessingsValues(value, goal);
                                  }
                                });

                                // if (frameThirtyThreeController.text.toUpperCase() ==
                                //     "RAM" && frameThirtyThreeController.text=="RAM") {
                                //   setState(() {
                                //     // typedRamCount=0;
                                //    typedRamCount= (typedRamCount + 1) ~/ 2;
                                //     // typedRamCount--;
                                //     // print(typedRamCount);
                                //   });
                                // }
                                // _text = value;
                                _startAnimation();
                                // typedRamCount=typedRamCount+1;
                                // if (value == "RAM") {
                                //   count = count + 1;

                                //   blessingsValues(value, goal);

                                //   // blessed(count, goal);

                                // }
                              },
                              // textCapitalization: TextCapitalization.values,
                              textCapitalization: TextCapitalization.characters,
                              // textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'Start typing RAM',
                                labelStyle: TextStyle(
                                  color: ColorConstant.red200,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: ColorConstant.red200,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: ColorConstant.red200,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                (_randomX * (1 - _animation.value)) * 100,
                                (_randomY * (1 - _animation.value)) * 50,
                              ),
                              child: Opacity(
                                opacity: _animation.value,
                                child: child,
                              ),
                            );
                          },
                          child: Text(
                            _text,
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
      ),
    );
  }

//   void updateCounter() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     FirebaseFirestore.instance.collection("bless").doc(user!.email).set({
//       'Total Blessings Earned': 0,
//       'Blessings Earned today': 0,
//       'Blessings in account': 0,
//       'Typed Ram': 0,
//       'Typed Ram Today': 0,
//       "timestamp": DateTime.now(),
//     }, SetOptions(merge: true));
// //     final databaseReference = FirebaseFirestore.instance.reference;
// // databaseReference.child("counter_values").child(todayDate).once().then((DataSnapshot snapshot) {
// //   int counterValue = snapshot.value ?? 0;
// //   print("Counter pressed today: $counterValue times.");
// // });
//   }

  // void retrieveLast24HoursCounter() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     final startTime =
  //         Timestamp.fromDate(DateTime.now().subtract(Duration(days: 1)));
  //     final endTime = Timestamp.fromDate(DateTime.now());
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection("bless")
  //         .where("timestamp", isGreaterThanOrEqualTo: startTime)
  //         .where("timestamp", isLessThanOrEqualTo: endTime)
  //         .get();
  //     num last24HoursCounter = 0;
  //     num last24HoursCounterTBE = 0;
  //     querySnapshot.docs.forEach((document) {
  //       last24HoursCounter += document["Typed Ram"];
  //       last24HoursCounterTBE += document["Total Blessings Earned"];
  //     });
  //     setState(() {
  //       _last24HoursCounter = last24HoursCounter.toInt();
  //       _last24HoursCounterTBE = last24HoursCounterTBE.toInt();
  //       // print("object");
  //       // print(_last24HoursCounter);
  //       // print(_last24HoursCounter);
  //     });
  //   }
  // }

  void blessingsValues(value, int countt) {
    if (count == countt) {
      // setState(() {
      //   // totalblessingsearned = totalblessingsearned + 1;
      //   blessinginaccount = blessinginaccount + 1;
      //   blessingsearnedtoday = blessingsearnedtoday + 1;
      // });

      // print(count);  
      setState(() {
        _text = value;
        // retrieveLast24HoursCounter();
        // ignore: unused_local_variable
        // FirebaseAuth auth = FirebaseAuth.instance;
        final firestore = FirebaseFirestore.instance;
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Get the current value
          DocumentReference documentReference =
              firestore.collection("bless").doc(user.email);
          documentReference.get().then((DocumentSnapshot snapshot) {
            int typedram = (snapshot.data() as Map)['Typed Ram'];
            int typedramtoday = (snapshot.data() as Map)['Typed Ram Today'];
            int tBE = (snapshot.data() as Map)['Total Blessings Earned'];
            int bIA = (snapshot.data() as Map)['Blessings in account'];
            int bIT = (snapshot.data() as Map)['Blessing Earned Today'];

            // Add to the current value
            int updatedValue = typedram + count;
            int updatetypedramtoday = typedramtoday + count;
            int updateTBE = tBE + count ~/ 108; // print(currentValue);
            int updateBIA = bIA + count ~/ 108; // print(currentValue);
            int updatebIT = bIT + count ~/ 108; // print(currentValue);
            int BlessEarnedRam =count ~/ 108; // print(currentValue);
            
            // Write the updated value back to the Firestore
            snapshot.reference.update({
              'Typed Ram': updatedValue,
              'timestamp': DateTime.now(),
              'Typed Ram Today': updatetypedramtoday,
              'Total Blessings Earned': updateTBE,
              'Blessings in account': updateBIA,
              'Blessing Earned Today': updatebIT,
              'Blessings By RAM':FieldValue.increment(BlessEarnedRam)
            });
          });
        }
      });
      Timer(const Duration(seconds: 1), () {
        _admobInterstitial.load();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoalAchieve(
              goall: goal.toString(),
              blessingsForGoalAchieve: blessingsForGoalAchieve.toString(),
            ),
          ),
        );
      });
    }

    Future.delayed(Duration(milliseconds: 150), () {
      frameThirtyThreeController.clear();
    });
  }
}

class Write extends StatefulWidget {
  final goal;
  final blessingsForGoalAchieve;
  Write({this.goal, this.blessingsForGoalAchieve});
  @override
  _WriteState createState() =>
      _WriteState(this.goal, this.blessingsForGoalAchieve);
}

class UpperCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class AudioService {
  static final AudioService _instance = AudioService._internal();
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  factory AudioService() {
    return _instance;
  }

  AudioService._internal();

  Future<void> play() async {
    if (!_isPlaying) {
      _isPlaying = true;
      await _audioPlayer.play(AssetSource('audio/ramnammantra.mp3'));
    }
  }

  Future<void> stop() async {
    if (_isPlaying) {
      _isPlaying = false;
      await _audioPlayer.stop();
    }
  }
}



// Original COde



// import 'package:flutter/material.dart';
// import 'package:bhaktiyoga_ios/core/app_export.dart';
// import 'package:bhaktiyoga_ios/ram/goal/exit_prayer.dart';
// import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
// import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
// import 'package:bhaktiyoga_ios/widgets/custom_button.dart';

// import '../../widgets/custom_text_form_field.dart';

// class Write extends StatefulWidget {
//   @override
//   State<Write> createState() => _WriteState();
// }

// class _WriteState extends State<Write> {
//   TextEditingController frameThirtyThreeController = TextEditingController();

//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConstant.gray900,
//         appBar: CustomAppBar(
//           height: getVerticalSize(
//             56.00,
//           ),
//           leadingWidth: 48,
//           leading: AppbarImage(
//             height: getSize(
//               25.00,
//             ),
//             width: getSize(
//               25.00,
//             ),
//             svgPath: ImageConstant.imgVolume,
//             margin: getMargin(
//               left: 23,
//               top: 15,
//               bottom: 15,
//             ),
//           ),
//           centerTitle: true,
//           title: CustomButton(
//             height: 32,
//             width: 100,
//             text: "$count/108",
//             padding: ButtonPadding.PaddingT5,
//             fontStyle: ButtonFontStyle.LoraRomanSemiBold14Gray900,
//             prefixWidget: Container(
//               margin: getMargin(
//                 right: 8,
//               ),
//               child: CustomImageView(
//                 svgPath: ImageConstant.imgDashboard,
//               ),
//             ),
//           ),
//           actions: [
//             AppbarImage(
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                           content: ExitPrayer(),
//                           backgroundColor: Colors.transparent,
//                         ));
//               },
//               height: getSize(
//                 27.00,
//               ),
//               width: getSize(
//                 27.00,
//               ),
//               svgPath: ImageConstant.imgVolumeYellow100,
//               margin: getMargin(
//                 left: 17,
//                 top: 14,
//                 right: 17,
//                 bottom: 14,
//               ),
//             ),
//           ],
//         ),
//         body: Container(
//           width: size.width,
//           padding: getPadding(
//             left: 42,
//             top: 14,
//             right: 42,
//             bottom: 14,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: getSize(
//                   296.00,
//                 ),
//                 width: getSize(
//                   296.00,
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Container(
//                         height: getSize(
//                           269.00,
//                         ),
//                         width: getSize(
//                           269.00,
//                         ),
//                         margin: getMargin(
//                           right: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           color: ColorConstant.gray700,
//                           borderRadius: BorderRadius.circular(
//                             getHorizontalSize(
//                               134.00,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     CustomImageView(
//                       imagePath: ImageConstant.imgPngegg1,
//                       height: getSize(
//                         296.00,
//                       ),
//                       width: getSize(
//                         296.00,
//                       ),
//                       alignment: Alignment.center,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Center(
//                   child: CustomTextFormField(
//                     width: 250,
//                     focusNode: FocusNode(),
//                     controller: frameThirtyThreeController,
//                     hintText: "Start Typing RAM",
//                     onChanged: (value) {
//                       // frameThirtyThreeController.text=
//                       print(value);

//                       if (value == "RAM") {
//                         setState(() {
//                           count++;
//                         });
//                         Future.delayed(Duration(milliseconds: 500), () {
//                           frameThirtyThreeController.clear();
//                         });
//                       }
//                     },
//                     textInputType: TextInputType.text,
//                     textInputAction: TextInputAction.next,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


