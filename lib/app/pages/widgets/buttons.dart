import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double width;

  const Buttons({
    super.key,
    required this.text,
    required this.onClicked,
    required this.width,
  });

  @override
  Widget build(BuildContext context) => Center(
    child:  ElevatedButton(
      
      style: ButtonStyle(
        backgroundColor: 
          MaterialStateProperty.all<Color>(ColorStyles.primary),
        shape: 
          MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
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
          color: ColorStyles.primaryBase,
          fontSize: 16,
          fontWeight: FontWeight.w700
        ),
      ),

    )



  );
      

}