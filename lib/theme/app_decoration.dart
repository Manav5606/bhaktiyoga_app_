import 'package:flutter/material.dart';
import 'package:bhaktiyoga_ios/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtFillGray900 => BoxDecoration(
        color: ColorConstant.gray900,
      );
  static BoxDecoration get outlineLime900 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.lime900,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: ColorConstant.gray900,
      );
  static BoxDecoration get fillGray800 => BoxDecoration(
        color: ColorConstant.gray800,
      );
  static BoxDecoration get outline => BoxDecoration();
  static BoxDecoration get outlineRed200 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.red200,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineYellow100b22 => BoxDecoration(
        color: ColorConstant.gray900,
        border: Border.all(
          color: ColorConstant.yellow100B2,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillYellow100 => BoxDecoration(
        color: ColorConstant.yellow100,
      );
  static BoxDecoration get outlineYellow100b21 => BoxDecoration(
        color: ColorConstant.yellow100,
        border: Border.all(
          color: ColorConstant.yellow100B2,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get outlineYellow100 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.yellow100,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get outlineYellow100b2 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.yellow100B2,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillLime900 => BoxDecoration(
        color: ColorConstant.lime900,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );

  static BorderRadius roundedBorder14 = BorderRadius.circular(
    getHorizontalSize(
      14.00,
    ),
  );

  static BorderRadius circleBorder21 = BorderRadius.circular(
    getHorizontalSize(
      21.00,
    ),
  );

  static BorderRadius roundedBorder55 = BorderRadius.circular(
    getHorizontalSize(
      55.00,
    ),
  );

  static BorderRadius customBorderBR37 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        35.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        37.00,
      ),
    ),
  );

  static BorderRadius roundedBorder18 = BorderRadius.circular(
    getHorizontalSize(
      18.00,
    ),
  );

  static BorderRadius circleBorder29 = BorderRadius.circular(
    getHorizontalSize(
      29.00,
    ),
  );
}
