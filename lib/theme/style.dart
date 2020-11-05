import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormStyle {
  static TextStyle label(ScreenUtil scu) => GoogleFonts.poppins(
        fontSize: 5 * scu.pixelRatio,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: Colors.white,
      );
}

class ColorTheme {
  static Color primaryColor() => Color(0xFF7638C2);
}

class DefaultTheme {
  static TextStyle textStyle(scu) => GoogleFonts.poppins(
        color: Colors.white,
      );

  static EdgeInsets paddingContainer(scu) => EdgeInsets.symmetric(
        horizontal: scu.pixelRatio * 5,
      );
}
