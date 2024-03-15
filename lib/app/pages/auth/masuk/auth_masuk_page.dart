import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/auth/masuk/auth_masuk_pembeli_page.dart';
import 'package:mager_spot/app/pages/auth/masuk/auth_masuk_penjual_page.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';

class AuthMasukPage extends StatefulWidget {
  const AuthMasukPage({super.key});

  @override
  State<AuthMasukPage> createState() => _AuthMasukPageState();
}

class _AuthMasukPageState extends State<AuthMasukPage> {

  late Size mediaSize;

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: ColorStyles.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 210,),
              Image.asset(
                "assets/logoWhite.png",
                width: 200,
                height: 204,
              ),
              SizedBox(height: 16,),

              //Slogan
              Text(
                "Temukan Semua yang Anda Butuhkan dalam Satu Aplikasi",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.primaryBase,
                ),
              ),
              SizedBox(height: 210,),
        
              //Button Daftar Penjual
              Buttons(
                text: "Masuk Sebagai Penjual", 
                colorBackground: ColorStyles.secondary,
                colorText: ColorStyles.primaryBase,
                width: mediaSize.width, 
                round: 12,
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => MasukPenjual()))), 
              ),

              SizedBox(height: 12,),

              //Button Daftar Pembeli
              Buttons(
                text: "Masuk Sebagai Pembeli", 
                colorBackground: ColorStyles.primaryBase, 
                colorText: ColorStyles.secondary,
                width: mediaSize.width, 
                round: 12, 
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => MasukPembeli()))), 
              ),



        
          
            ],
          ),
        ),
      ),


    );
  }
}