import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    Key? key,
      required this.controller,
      required this.textInputType,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  State<TextFields> createState() => _TextFieldsState();

}

class _TextFieldsState extends State<TextFields> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child:  TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,

        style:  GoogleFonts.nunito(
          color: ColorStyles.darkGrey,
          fontSize: 13,
          fontWeight: FontWeight.w500
        ),

      ),

    );
  }

}