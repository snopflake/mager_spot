import 'package:flutter/gestures.dart';
import 'package:mager_spot/app/pages/fill_profile_page.dart';
import 'package:mager_spot/app/pages/signup_page.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/facebook_buttons.dart';
import 'package:mager_spot/app/pages/widgets/google_buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Selamat Datang Kembali!",
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
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16,),
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
          SizedBox(height: 8.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                    text: "Lupa password?",
                    style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorStyles.darkGrey,
                 ),
                )
              ),
            ],
          ),
          SizedBox(height: 24,),

          // PPP TOMBOL DISINIII
          Buttons(
            text: "Masuk", 
            width: mediaSize.width,
            onClicked: () => 
            Navigator.push(context, MaterialPageRoute(builder: ((context) => FillProfilePage()))), 
          ),


          SizedBox(height: 24,),
          Text(
            "atau masuk dengan",
            style: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorStyles.black,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              GoogleButtons(
                text: "Google",
                onClicked: (){},
                width: 122,
              ),
               SizedBox(width: 15),
              FacebookButtons(
                text: "Facebook",
                onClicked: (){},
                width: 122,
              ),

            ],
          ),
          SizedBox(height: 24,),
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
                  text: " Daftar",
                  style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.black,
                   ),
                   recognizer: TapGestureRecognizer()..onTap = () => 
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => SignUpPage()))),
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
