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
