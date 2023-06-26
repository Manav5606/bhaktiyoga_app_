import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        getHorizontalSize(width ?? 0),
        getVerticalSize(height ?? 0),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      case ButtonPadding.PaddingT25:
        return getPadding(
          left: 25,
          top: 25,
          bottom: 25,
        );
      case ButtonPadding.PaddingAll15:
        return getPadding(
          all: 15,
        );
      case ButtonPadding.PaddingT5:
        return getPadding(
          top: 5,
          right: 5,
          bottom: 5,
        );
      default:
        return getPadding(
          all: 6,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineYellow100:
        return ColorConstant.yellow100;
      case ButtonVariant.OutlineLime900:
        return ColorConstant.lime900;
      case ButtonVariant.FillLime900:
        return ColorConstant.lime900;
      case ButtonVariant.gray700:
        return ColorConstant.gray700;
      case ButtonVariant.grey:
        return ColorConstant.grey;
      case ButtonVariant.OutlineRed200:
        return ColorConstant.gray900;
      case ButtonVariant.OutlineLime900_1:
      case ButtonVariant.OutlineYellow100_1:
        return null;
      default:
        return ColorConstant.yellow100;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineYellow100:
        return BorderSide(
          color: ColorConstant.yellow100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineLime900:
        return BorderSide(
          color: ColorConstant.lime900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineLime900_1:
        return BorderSide(
          color: ColorConstant.lime900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineRed200:
        return BorderSide(
          color: ColorConstant.red200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineYellow100_1:
        return BorderSide(
          color: ColorConstant.yellow100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
        ;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder24:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      case ButtonShape.RoundedBorder9:
        return BorderRadius.circular(
          getHorizontalSize(
            9.00,
          ),
        );
      case ButtonShape.RoundedBorder28:
        return BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.LoraRomanSemiBold18:
        return TextStyle(
          color: ColorConstant.lime900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.LoraRomanSemiBold18Yellow100:
        return TextStyle(
          color: ColorConstant.yellow100,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.LoraRomanSemiBold2468:
        return TextStyle(
          color: ColorConstant.yellow100,
          fontSize: getFontSize(
            24.68,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.LoraRomanSemiBold18Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.LoraRomanRegular20:
        return TextStyle(
          color: ColorConstant.lime900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.LoraRomanSemiBold14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.LoraRomanRegular16:
        return TextStyle(
          color: ColorConstant.yellow100B2,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.LoraRomanSemiBold16:
        return TextStyle(
          color: ColorConstant.yellow100,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.LoraRomanSemiBold1267:
        return TextStyle(
          color: ColorConstant.lime900,
          fontSize: getFontSize(
            12.67,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.darklime:
        return TextStyle(
          color: ColorConstant.limedark,
          fontSize: getFontSize(
            12.67,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.lime900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Lora',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder14,
  CircleBorder24,
  RoundedBorder9,
  RoundedBorder28,
}

enum ButtonPadding {
  PaddingAll6,
  PaddingAll11,
  PaddingT25,
  PaddingAll15,
  PaddingT5,
}

enum ButtonVariant {
  gray700,
  grey,
  FillYellow100,
  OutlineYellow100,
  OutlineLime900,
  FillLime900,
  OutlineLime900_1,
  OutlineRed200,
  OutlineYellow100_1,
}

enum ButtonFontStyle {
  LoraRomanSemiBold14,
  LoraRomanSemiBold18,
  LoraRomanSemiBold18Yellow100,
  LoraRomanSemiBold2468,
  LoraRomanSemiBold18Gray900,
  LoraRomanRegular20,
  LoraRomanSemiBold14Gray900,
  LoraRomanRegular16,
  LoraRomanSemiBold16,
  LoraRomanSemiBold1267,
  darklime,
}
