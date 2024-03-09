import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text("Halo, kamu sampai di homepage :)", 
      style: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorStyles.primary
      ),)),
    );
  }
}