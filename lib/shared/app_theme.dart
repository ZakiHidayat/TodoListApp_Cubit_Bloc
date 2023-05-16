import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const double defaultRadius = 10;
  static const double defaultMargin = 12;

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color purpleColor = Colors.purple;

  static final TextStyle blackTextStyle =
      GoogleFonts.archivo(color: blackColor);
  static final TextStyle whiteTextStyle =
      GoogleFonts.archivo(color: whiteColor);
  static final TextStyle greyTextStyle = GoogleFonts.archivo(color: greyColor);
  static final TextStyle purpleTextStyle =
      GoogleFonts.archivo(color: purpleColor);
}
