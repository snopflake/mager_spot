import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/auth/daftar/auth_daftar_penjual_page.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';

class AuthDaftarPage extends StatefulWidget {
  const AuthDaftarPage({super.key});

  @override
  State<AuthDaftarPage> createState() => _AuthDaftarPageState();
}

class _AuthDaftarPageState extends State<AuthDaftarPage> {

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
                "Bergabunglah dengan Magerspot!",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.primaryBase,
                ),
              ),
              SizedBox(height: 220,),
        
              //Button Daftar Penjual
              Buttons(
                text: "Daftar Sebagai Penjual", 
                colorBackground: ColorStyles.secondary,
                colorText: ColorStyles.primaryBase,
                width: mediaSize.width, 
                round: 12,
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => DaftarPenjual()))), 
              ),

              SizedBox(height: 12,),

              //Button Daftar Pembeli
              Buttons(
                text: "Daftar Sebagai Pembeli", 
                colorBackground: ColorStyles.primaryBase, 
                colorText: ColorStyles.secondary,
                width: mediaSize.width, 
                round: 12, 
                onClicked: () {}
              ),

              SizedBox(height: 22,)

        
          
            ],
          ),
        ),
      ),


    );
  }
}