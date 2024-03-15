import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/auth/daftar/auth_daftar_page.dart';
import 'package:mager_spot/app/pages/auth/masuk/auth_masuk_page.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

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
                "Platform All-in-One untuk Kebutuhan Anda",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.primaryBase,
                ),
              ),
              SizedBox(height: 220,),
        
              //Button Daftar
              Buttons(
                text: "Daftar", 
                colorBackground: ColorStyles.secondary,
                colorText: ColorStyles.primaryBase,
                width: mediaSize.width, 
                round: 12,
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => AuthDaftarPage()))),
              ),

              SizedBox(height: 12,),

              //Button Masuk
              Buttons(
                text: "Masuk", 
                colorBackground: ColorStyles.primaryBase, 
                colorText: ColorStyles.secondary,
                width: mediaSize.width, 
                round: 12, 
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => AuthMasukPage()))),
              ),

              SizedBox(height: 22,)

        
          
            ],
          ),
        ),
      ),


    );
  }
}