import 'package:flutter/material.dart';

class ColorsManager {
  static Color primary = HexColor.fromHex("#00a9b8");
  static Color welcome1 = HexColor.fromHex("#118A9F");
  static Color welcome1_1 = HexColor.fromHex("#117694");
  static Color welcome2 = HexColor.fromHex("#AEE0C5");
  static Color welcome2_2 = HexColor.fromHex("#73BEA0");
  static Color welcome3 = HexColor.fromHex("#059B9C");
  static Color welcome3_3 = HexColor.fromHex("#007775");

  static Color kBlue = HexColor.fromHex("#005EFF");

  static Color loginBackground = HexColor.fromHex("#FFA500");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
