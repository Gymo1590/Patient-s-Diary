import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildCategory(String name, Color defaultFontColor, Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: size.height * 0.025,
      horizontal: size.width * 0.075,
    ),
    child: Text(
      name,
      style: GoogleFonts.poppins(
        color: defaultFontColor,
        fontSize: size.width * 0.05,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
