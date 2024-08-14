import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomDimText extends StatelessWidget {
  final double sizeFont;
  final Color colorFont;
  final String value;

  const BottomDimText({
    super.key,
    required this.sizeFont,
    required this.colorFont,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        value,
        maxLines:3,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          fontSize: sizeFont,
          color: colorFont,
        ),
      ),
    );
  }
}
