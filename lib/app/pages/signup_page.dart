import 'package:flutter/gestures.dart';
import 'package:mager_spot/app/pages/fill_profile_page.dart';
import 'package:mager_spot/app/pages/login_page.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/facebook_buttons.dart';
import 'package:mager_spot/app/pages/widgets/google_buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
            textInputType: TextInputType.emailAddress,
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
          TextFields(
            controller: emailController,
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFields(
            controller: passwordController,
            textInputType: TextInputType.name,
          ),

          //PPP TOMBOL DISINII
          SizedBox(height: 47,),
          Buttons(
            text: "Daftar", 
            onClicked: () => 
            Navigator.push(context, MaterialPageRoute(builder: ((context) => FillProfilePage()))), 
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
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => LoginPage()))),
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
