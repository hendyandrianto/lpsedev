// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ColorResources {
  static Color getColombiaBlue(BuildContext context) {
    return const Color(0xFF92C6FF);
  }

  static Color getLightSkyBlue(BuildContext context) {
    return const Color(0xFF8DBFF6);
  }

  static Color getHarlequin(BuildContext context) {
    return const Color(0xFF3FCC01);
  }

  static Color getCheris(BuildContext context) {
    return const Color(0xFFE2206B);
  }

  static Color getGrey(BuildContext context) {
    return const Color(0xFFF1F1F1);
  }

  static Color getRed(BuildContext context) {
    return const Color(0xFFD32F2F);
  }

  static Color getYellow(BuildContext context) {
    return const Color(0xFFFFAA47);
  }

  static Color getHint(BuildContext context) {
    return const Color(0xFF9E9E9E);
  }

  static Color getBottomSheetColor(BuildContext context) {
    return const Color(0xFFF4F7FC);
  }

  static Color getGainsBoro(BuildContext context) {
    return const Color(0xFFE6E6E6);
  }

  static Color getTextBg(BuildContext context) {
    return const Color(0xFFF3F9FF);
  }

  static Color getIconBg(BuildContext context) {
    return const Color(0xFFF9F9F9);
  }

  static Color getHomeBg(BuildContext context) {
    return const Color(0xFFf7f7f7);
  }

  static Color getImageBg(BuildContext context) {
    return const Color(0xFFE2F0FF);
  }

  static Color getSellerTxt(BuildContext context) {
    return const Color(0xFF92C6FF);
  }

  static Color getChatIcon(BuildContext context) {
    return const Color(0xFFD4D4D4);
  }

  static Color getLowGreen(BuildContext context) {
    return const Color(0xFFEFF6FE);
  }

  static Color getGreen(BuildContext context) {
    return const Color(0xFF23CB60);
  }

  static Color getFloatingBtn(BuildContext context) {
    return const Color(0xFF7DB6F5);
  }

  static Color getPrimary(BuildContext context) {
    return const Color(0xFF1B7FED);
  }

  static Color getTextTitle(BuildContext context) {
    return const Color(0xFF333333);
  }

  static const primaryGradient = LinearGradient(
    colors: [
      Color.fromRGBO(33, 107, 255, 1),
      Color.fromRGBO(0, 65, 203, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color BLACK = Color(0xff000000);
  static const Color WHITE = Color(0xffFFFFFF);
  static const Color LIGHT_SKY_BLUE = Color(0xff8DBFF6);
  static const Color HARLEQUIN = Color(0xff3FCC01);
  static const Color CERISE = Color(0xffE2206B);
  static const Color GREY = Color(0xffF1F1F1);
  static const Color RED = Color(0xFFD32F2F);
  static const Color YELLOW = Color(0xFFFFAA47);
  static const Color HINT_TEXT_COLOR = Color(0xff9E9E9E);
  static const Color GAINS_BORO = Color(0xffE6E6E6);
  static const Color TEXT_BG = Color(0xffF3F9FF);
  static const Color ICON_BG = Color(0xffF9F9F9);
  static const Color HOME_BG = Color(0xffF0F0F0);
  static const Color IMAGE_BG = Color(0xffE2F0FF);
  static const Color SELLER_TXT = Color(0xff92C6FF);
  static const Color CHAT_ICON_COLOR = Color(0xffD4D4D4);
  static const Color LOW_GREEN = Color(0xffEFF6FE);
  static const Color GREEN = Color(0xff23CB60);
  static const Color BLUE = Color.fromRGBO(58, 118, 186, 1);
  static const Color BLUE2 = Color.fromRGBO(113, 164, 237, 1);
  static const Color GREY6 = Color.fromRGBO(164, 164, 164, 1);
  static const Color GREY2 = Color.fromRGBO(204, 215, 228, 1);
  static const Color DARKGREY = Color.fromRGBO(77, 77, 77, 1);
  static const Color GREY4 = Color.fromRGBO(205, 205, 205, 1);
  static const Color GREY3 = Color.fromRGBO(243, 243, 243, 1);
  static const Color GREY5 = Color.fromRGBO(232, 240, 248, 1);

  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };
  static const Color kPrimaryColor = Color(0xFF111F5C);
  static const Color kSecondaryColor = Color(0xFF139AD6);
  static const Color kGreyColor = Color(0xFF888888);
  static const MaterialColor PRIMARY_MATERIAL =
      MaterialColor(0xFF192D6B, colorMap);
}
