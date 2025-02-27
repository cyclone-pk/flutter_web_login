import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle get header => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  static TextStyle get regular => GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );
}
