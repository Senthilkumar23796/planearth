import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planearth/constants/colors.dart';

class ModelTextField extends StatelessWidget {
  const ModelTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.inputType,
    this.validator,
    this.inputFormat,
    this.isVisble = false,
    this.maxiLength,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final FormFieldValidator? validator;
  final List<TextInputFormatter>? inputFormat;
  final bool isVisble;
  final int? maxiLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      //Automatically validate without press the submit button
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isVisble,
      cursorColor: Colors.white60,
      keyboardType: inputType,
      maxLength: maxiLength,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorStyle: GoogleFonts.inter(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 11.0,
        ),
        counterText: "",
        hintStyle: GoogleFonts.inter(
          fontSize: 14.0,
          color: Colors.white38,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color:errorField, width: 2.0),
        ),
      ),
    );
  }
}
