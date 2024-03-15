import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String text;
  final Color colorBackground;
  final Color colorText;
  final double width;
  final double round;
  final VoidCallback onClicked;

  const Buttons({
    super.key,
    required this.text,
    required this.colorBackground,
    required this.colorText,
    required this.width,
    required this.round,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => Center(
    child:  ElevatedButton(
      
      style: ButtonStyle(
        backgroundColor: 
          MaterialStateProperty.all<Color>(colorBackground),
        shape: 
          MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(round),
            ),
          ),
        elevation: 
          MaterialStateProperty.all<double>(0),
        minimumSize: 
          MaterialStateProperty.all<Size>(Size(width, 48)),
      ),

      onPressed: onClicked,
      child: Text(
        text,
        style: GoogleFonts.nunito(
          color: colorText,
          fontSize: 16,
          fontWeight: FontWeight.w700
        ),
      ),

    )



  );
      

}