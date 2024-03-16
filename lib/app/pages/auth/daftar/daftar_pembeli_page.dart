import 'package:flutter/gestures.dart';
import 'package:mager_spot/app/pages/auth/daftar/confirm_pembeli.dart';
import 'package:mager_spot/app/pages/auth/masuk/masuk_pembeli_page.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/pages/widgets/text_fields_password.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaftarPembeli extends StatefulWidget {
  const DaftarPembeli({super.key});

  @override
  State<DaftarPembeli> createState() => _DaftarPembeliState();
}

class _DaftarPembeliState extends State<DaftarPembeli> {

  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
          backgroundColor: ColorStyles.primary,
          body: Stack(children: [
            Positioned(top: 80, child: _buildAtas()),
            Positioned(bottom: 0, child: _buildBawah())
          ],
        ),
      ),
    );

  }

  Widget _buildAtas() {

    return SizedBox(
      width: mediaSize.width,
      child: Column( 
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/logoWhiteDua.png",
            height: 200,
            width: 200,
          ),
          SizedBox(height: 41)
        ],

      ),


    );
  }

  Widget _buildBawah() {

    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          )
        ),
        child: _buildForm(),
      ),
    );

  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 66, left: 54, right: 54),
      child: Column(
        children: [
          Text(
            "Selamat Datang!",
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorStyles.black
            ),
          ),
          SizedBox(height: 26,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFields(
            controller: namaController,
            textInputType: TextInputType.name,
            text: "",
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),

          //Gaperlu Email UB
          TextFields(
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            text: "",
          ),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Kata Sandi",
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFieldsPassword(
            controller: passwordController, 
            textInputType: TextInputType.name, 
            text: ""),

          //PPP TOMBOL DISINII
          SizedBox(height: 47,),
          Buttons(
            text: "Daftar", 
            round: 24,
            colorBackground: ColorStyles.secondary,
            colorText: ColorStyles.primaryBase,
            onClicked: () => 
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ConfirmPembeli()))), 
            width: mediaSize.width
          ),

          SizedBox(height: 49,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(text: TextSpan(
              text: "Belum punya akun?",
                style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorStyles.black,
                ),
                children: [
                  TextSpan(
                  text: " Masuk",
                  style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.black,
                   ),
                   recognizer: TapGestureRecognizer()..onTap = () => 
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MasukPembeli()))),
                  )
                 ]
                )
              ),
            ],
          ),




        ],
      ),
    );
  }



}