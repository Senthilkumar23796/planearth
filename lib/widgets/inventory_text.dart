import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InventoryText extends StatelessWidget {
  final double sizeFont;
  final Color colorFont;
  final String value;

  const InventoryText({
    super.key,
    required this.sizeFont,
    required this.colorFont,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: sizeFont,
        color: colorFont,
      ),
      textAlign: TextAlign.center,

    );
  }
}
