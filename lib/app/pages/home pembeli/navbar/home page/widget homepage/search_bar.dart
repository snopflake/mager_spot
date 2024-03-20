import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarKu extends StatefulWidget {
  const SearchBarKu({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;

  @override
  State<SearchBarKu> createState() => _SearchBarKuState();
}

class _SearchBarKuState extends State<SearchBarKu> {
  @override
  Widget build(BuildContext context) {

  late Size mediaSize;
  mediaSize = MediaQuery.of(context).size;
  
    return SizedBox(
      width: 311.w,
      height: 40.h,
      child: TextFormField(

        controller: widget.controller,
        keyboardType: TextInputType.name,

        style: GoogleFonts.nunito(
            color: ColorStyles.darkGrey,
            fontSize: 16,
            fontWeight: FontWeight.w400),

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1),
          ),
          
          fillColor: ColorStyles.lightGrey,
          hintText: widget.text,
          prefixIcon: Icon(Icons.search_rounded, color: ColorStyles.darkGrey,),
      
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              width: 2,
              color: ColorStyles.black,
            ),
          ),

        ),

      ),
    );
  }
}