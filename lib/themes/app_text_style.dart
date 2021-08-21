import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_color.dart';

abstract class AppTextStyle {
  static final headline1 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black,
      fontSize: StiloFontSize.xl5,
      fontWeight: StiloFontWeight.semiBold,
    ),
  );

  static final headline2 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black,
      fontSize: StiloFontSize.xl4,
      fontWeight: StiloFontWeight.semiBold,
    ),
  );

  static final headline3 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black,
      fontSize: StiloFontSize.xl3,
      fontWeight: StiloFontWeight.semiBold,
    ),
  );

  static final headline4 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black,
      fontSize: StiloFontSize.xl2,
      fontWeight: StiloFontWeight.semiBold,
    ),
  );

  static final headline5 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black,
      fontSize: StiloFontSize.xl,
      fontWeight: StiloFontWeight.semiBold,
    ),
  );

  static final bodyText1 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black50,
      fontSize: StiloFontSize.xl2,
      fontWeight: StiloFontWeight.regular,
    ),
  );

  static final bodyText2 = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.black50,
      fontSize: StiloFontSize.xl,
      fontWeight: StiloFontWeight.regular,
    ),
  );

  static final buttonText = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: StiloColor.white,
      fontSize: StiloFontSize.xl2,
      fontWeight: StiloFontWeight.semiBold,
    ),
  );

  static final linkButtonText = headline4.copyWith(
    color: AppColor.primary,
    decoration: TextDecoration.underline,
  );

  static final priceText = GoogleFonts.sourceSansPro(
    textStyle: const TextStyle(
      color: AppColor.primary,
      fontSize: StiloFontSize.xl3,
      fontWeight: StiloFontWeight.bold,
    ),
  );
}
