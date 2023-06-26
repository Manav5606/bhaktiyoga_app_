import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';
import 'package:bhaktiyoga_ios/ram/goal/exit_prayer.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/appbar_image.dart';
import 'package:bhaktiyoga_ios/widgets/app_bar/custom_app_bar.dart';
import 'package:bhaktiyoga_ios/widgets/custom_button.dart';
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

class _DisappearingTextFormFielddState extends State<DisappearingTextFormFieldd>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  String _text = '';
  late int _randomX;
  late int _randomY;
  TextEditingController frameThirtyThreeController = TextEditingController();

  int count = 0;

  @override
  void initState() {
    super.initState();
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
    return SafeArea(
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
            text: "$count/108",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getSize(
                  296.00,
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
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        width: 250,
                        focusNode: FocusNode(),
                        controller: frameThirtyThreeController,
                        hintText: "Start Typing RAM",
                        onChanged: (value) {
                          // frameThirtyThreeController.text=
                          print(value);
                          _startAnimation();
                          if (value == "RAM") {
                            setState(() {
                              count++;
                              _text = value;
                            });

                            Future.delayed(Duration(milliseconds: 500), () {
                              frameThirtyThreeController.clear();
                            });
                          }
                        },
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
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
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 20),
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
    );
  }
}

class DisappearingTextFormFieldd extends StatefulWidget {
  @override
  _DisappearingTextFormFielddState createState() =>
      _DisappearingTextFormFielddState();
}
