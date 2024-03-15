import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class TextFieldsPassword extends StatefulWidget {
  const TextFieldsPassword({
    Key? key,
      required this.controller,
      required this.textInputType,
      required this.text,
      
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final String text;

  @override
  State<TextFieldsPassword> createState() => _TextFieldsPasswordState();

}

class _TextFieldsPasswordState extends State<TextFieldsPassword> {

  bool _obscureText = true;

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

        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          child: Icon(_obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          
          )
        ),
        
        obscureText: _obscureText,

      ),

    );
  }

}