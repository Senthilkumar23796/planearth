import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class TreeTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final FormFieldValidator? validator;
  final int? maxiLines;
  final bool? enabled;
  //final List<TextInputFormatter>? inputFormat;

  const TreeTextField({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.inputType,
    this.validator,
    this.maxiLines,
    this.enabled=true,
  });

  @override
  State<TreeTextField> createState() => _TreeTextFieldState();
}

class _TreeTextFieldState extends State<TreeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.inputType,
      enabled: widget.enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxiLines,
      cursorColor: Colors.black54,
      //inputFormatters: inputFormat,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.15),
        errorStyle: GoogleFonts.inter(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 11.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: errorField, width: 2.0),
        ),
      ),
    );
  }
}
