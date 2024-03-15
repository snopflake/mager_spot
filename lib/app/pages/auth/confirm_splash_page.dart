import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/fillprofile_page.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';


class ConfirmSpalshPage extends StatefulWidget {
  const ConfirmSpalshPage({super.key});

  @override
  State<ConfirmSpalshPage> createState() => _ConfirmSpalshPageState();
}

class _ConfirmSpalshPageState extends State<ConfirmSpalshPage> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => FillProfilePage())));

     });
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primaryBase,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/confirm.gif",
              width: 150, 
              height: 150,
              ),
            SizedBox(height: 16,),
            Text(
              "Akun Anda Berhasil Terdaftar",
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorStyles.pureBlack,
              ),
            )
            

         ],
        ),
      ),
    );
  }
}
