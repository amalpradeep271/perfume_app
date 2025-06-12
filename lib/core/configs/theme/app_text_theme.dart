import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle base = getAppTextStyleCustomized();
  static TextStyle montserratStyle = getAppTextStyleCustomized();

  static TextStyle getAppTextStyleCustomized({
    double textSize = 20,
    double textHeight = 0,
    FontWeight textWeight = FontWeight.normal,
    Color textColor = AppColors.black,
  }) {
    return GoogleFonts.poppins(
      height: textHeight,
      fontSize: textSize,
      fontWeight: textWeight,
      color: textColor,
    );
  }

  static TextStyle getMontserratTextStyleCustomized({
    double textSize = 20,
    double textHeight = 0,
    FontWeight textWeight = FontWeight.normal,
    Color textColor = AppColors.black,
  }) {
    return GoogleFonts.montserrat(
      height: textHeight,
      fontSize: textSize,
      fontWeight: textWeight,
      color: textColor,
    );
  }
}

extension AppFontWeight on TextStyle {
  /// FontWeight.w100
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);

  /// FontWeight.w200
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);

  /// FontWeight.w300
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  /// FontWeight.w400
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  /// FontWeight.w500
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  /// FontWeight.w600
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  /// FontWeight.w700
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  /// FontWeight.w800
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);

  /// FontWeight.w900
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

extension AppFontSize on TextStyle {
  /// fontSize: 10
  TextStyle get s10 => copyWith(fontSize: 10);

  /// fontSize: 12
  TextStyle get s12 => copyWith(fontSize: 12);

  /// fontSize: 14
  TextStyle get s14 => copyWith(fontSize: 14);

  /// fontSize: 16
  TextStyle get s16 => copyWith(fontSize: 16);

  /// fontSize: 18
  TextStyle get s18 => copyWith(fontSize: 18);

  /// fontSize: 20
  TextStyle get s20 => copyWith(fontSize: 20);

  ///
  TextStyle get s22 => copyWith(fontSize: 48);

  /// fontSize: 24
  TextStyle get s24 => copyWith(fontSize: 24);

  /// fontSize: 32
  TextStyle get s32 => copyWith(fontSize: 32);

  /// fontSize: 40
  TextStyle get s40 => copyWith(fontSize: 40);

  /// fontSize: 48
  TextStyle get s48 => copyWith(fontSize: 48);
}

extension AppFontColor on TextStyle {
  TextStyle get greycolor => copyWith(color: AppColors.grey);

  TextStyle get whiteColor => copyWith(color: AppColors.white);

  TextStyle get blackColor => copyWith(color: AppColors.black);

  TextStyle get greenColor => copyWith(color: AppColors.green);


  TextStyle get redColor => copyWith(color: AppColors.red);

  TextStyle get lightgrayColor =>
      copyWith(color: const Color.fromARGB(193, 170, 170, 170));

  TextStyle get grayColor =>
      copyWith(color: const Color.fromARGB(255, 146, 144, 144));
}

extension AppFontStyle on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension AppFontDecoration on TextStyle {
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get noneDecoration => copyWith(decoration: TextDecoration.none);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}

extension AppFontFamily on TextStyle {
  TextStyle get montserrat =>
      copyWith(fontFamily: GoogleFonts.montserrat().fontFamily);
  TextStyle get poppins =>
      copyWith(fontFamily: GoogleFonts.poppins().fontFamily);
}
