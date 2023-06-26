import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray700 = fromHex('#79543a');

  static Color yellow10026 = fromHex('#26fcecc6');

  static Color black900 = fromHex('#000000');

  static Color yellow100B2 = fromHex('#b2fcecc6');

  static Color bluegray400 = fromHex('#888888');

  static Color gray800 = fromHex('#70392b');

  static Color lime900 = fromHex('#9b5134');
  static Color limedark = fromHex('#634939');

  static Color gray900 = fromHex('#3a2c23');
  static Color grey = fromHex('#746654');

  static Color red200 = fromHex('#cda899');

  static Color black90091 = fromHex('#91000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color yellow100 = fromHex('#fcecc6');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
