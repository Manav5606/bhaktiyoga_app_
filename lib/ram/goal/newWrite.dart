// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/goal/exit_prayer.dart';
import 'package:bhaktiyoga_ios/ram/goal/goal_achieved.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
import 'dart:math';
import '../../widgets/custom_text_form_field.dart';

class _newWriteState extends State<newWrite>
    with SingleTickerProviderStateMixin {
  final goal;
  final blessingsForGoalAchieve;
  late AnimationController _controller;
  late Animation _animation;
  String _text = '';
  late int _randomX;
  late int _randomY;
  TextEditingController frameThirtyThreeController = TextEditingController();

  int count = 0;
  int typedRamCount = 0;
  int totalblessingsearned = 0;
  int totalblessingsearned2 = 0;
  int blessingsearnedtoday = 0;
  // int typedram = 0;
  int blessinginaccount = 0;
  int _cursorPos = 0;
  int _count = 0;
  bool _isUpdating = false;

  _newWriteState(this.goal, this.blessingsForGoalAchieve);

  @override
  void initState() {
    super.initState();
    // retrieveLast24HoursCounter();
    frameThirtyThreeController.addListener(() {
      if (!_isUpdating) {
        setState(() {
          _cursorPos = frameThirtyThreeController.selection.baseOffset;
          if (frameThirtyThreeController.text.toUpperCase() == 'RAM') {
            _count++;
          }
          _isUpdating = true;
          frameThirtyThreeController.value =
              frameThirtyThreeController.value.copyWith(
            text: frameThirtyThreeController.text.toUpperCase(),
            selection: TextSelection.collapsed(offset: _cursorPos),
          );
          _isUpdating = false;
        });
      }
    });

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
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: ExitPrayer(),
                  backgroundColor: Colors.transparent,
                ));
        FocusScope.of(context).unfocus();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.gray900,
          appBar: CustomAppBar(
            height: getVerticalSize(
              56.00,
            ),
            leadingWidth: 48,
            leading: AppbarImage(
              height: getSize(
                25.00,
              ),
              width: getSize(
                25.00,
              ),
              svgPath: ImageConstant.imgVolume,
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
              text: "$_count/$goal",
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
            width: size.width,
            padding: getPadding(
              left: 42,
              top: 14,
              right: 42,
              bottom: 14,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        CustomImageView(
                          imagePath: ImageConstant.imgPngegg1,
                          height: getSize(
                            296.00,
                          ),
                          width: getSize(
                            296.00,
                          ),
                          alignment: Alignment.center,
                        ),
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
                              height: 50,
                              width: 350,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                  // UpperCaseTextInputFormatter(),
                                ],
                                style: TextStyle(color: ColorConstant.red200),
                                controller: frameThirtyThreeController,
                                keyboardType: TextInputType.name,
                                // autocorrect: false,
                                // autofocus: true,
                                // textCapitalization: TextCapitalization.characters,
                                onChanged: (value) {
                                  // frameThirtyThreeController.text=
                                  // print(value);
                                  if (value == "RAM") {
                                    typedRamCount++;

                                    Future.delayed(Duration(milliseconds: 350),
                                        () {
                                      frameThirtyThreeController.clear();
                                    });
                                  }
                                },
                                textInputAction: TextInputAction.next,
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
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20),
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
      ),
    );
  }

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
            // newWrite the updated value back to the Firestore
            snapshot.reference.update({
              'Typed Ram': updatedValue,
              'timestamp': DateTime.now(),
              'Typed Ram Today': updatetypedramtoday,
              'Total Blessings Earned': updateTBE,
              'Blessings in account': updateBIA,
              'Blessing Earned Today': updatebIT
            });
          });
        }
      });
      Timer(const Duration(seconds: 1), () {
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

    Future.delayed(Duration(milliseconds: 350), () {
      frameThirtyThreeController.clear();
    });
  }
}

class newWrite extends StatefulWidget {
  final goal;
  final blessingsForGoalAchieve;
  newWrite({this.goal, this.blessingsForGoalAchieve});
  @override
  _newWriteState createState() =>
      _newWriteState(this.goal, this.blessingsForGoalAchieve);
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


// }


