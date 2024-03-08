import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class GoogleButtons extends StatelessWidget {
  
  final String text;
  final VoidCallback onClicked;
  final double width;

  const GoogleButtons({
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
          MaterialStateProperty.all<Color>(ColorStyles.lightGrey),
        shape: 
          MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        elevation: 
          MaterialStateProperty.all<double>(0),
        minimumSize: 
          MaterialStateProperty.all<Size>(Size(width, 42)),
      ),

      onPressed: onClicked,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/googleLogo.png",
            height: 15,
            width: 15,
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.nunito(
              color: ColorStyles.black,
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),

    )



  );
      

}