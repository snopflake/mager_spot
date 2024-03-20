import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mager_spot/app/pages/auth/daftar/main_daftar.dart';
import 'package:mager_spot/app/pages/auth/daftar/penjual/confirm_penjual.dart';
import 'package:mager_spot/app/pages/auth/masuk/penjual/masuk_penjual.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/pages/widgets/text_fields_password.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaftarPenjual extends StatefulWidget {
  const DaftarPenjual({super.key});

  @override
  State<DaftarPenjual> createState() => _DaftarPenjualState();
}

class _DaftarPenjualState extends State<DaftarPenjual> {

  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  bool isClickable = false;

  void checkClickable() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final nama = namaController.text.trim();
    setState(() {
      isClickable = email.isNotEmpty && password.isNotEmpty && nama.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
          backgroundColor: ColorStyles.primary,
          body: Stack(children: [
            Positioned(top: 68, child: _buildAtas()),
            Positioned(bottom: 0, child: _buildBawah())
          ],
        ),
      ),
    );

  }

  Widget _buildAtas() {

    return SizedBox(
      width: mediaSize.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column( 
          mainAxisSize: MainAxisSize.min,
          children: [
            
            //Tombol back
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      child: IconButton(
                        onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => MainDaftar()))),  
                        icon: Icon(
                        Icons.arrow_back_ios_new_rounded, 
                        color: ColorStyles.primaryBase,)
                      ),
                    ),
                  ],
                ),
        
            Image.asset(
              "assets/logoWhiteDua.png",
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(height: 41.h)
          ],
        
        ),
      ),


    );
  }

  Widget _buildBawah() {

    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorStyles.black
            ),
          ),
          SizedBox(height: 26.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
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
            onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),

          //Email UB
          TextFields(
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            text: "@student.ub.ac.id",
            onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
          ),
          
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Kata Sandi",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFieldsPassword(
            controller: passwordController, 
            textInputType: TextInputType.name, 
            text: "",
            onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
            ),

          //PPP TOMBOL DISINII
          SizedBox(height: 47.h,),
          Buttons(
            text: "Daftar", 
            round: 24.r,
            colorBackground: ColorStyles.secondary,
            colorText: ColorStyles.primaryBase,
            onClicked: () => 
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ConfirmPenjual()))), 
            width: mediaSize.width
          ),

          SizedBox(height: 49.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(text: TextSpan(
              text: "Belum punya akun?",
                style: GoogleFonts.nunito(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ColorStyles.black,
                ),
                children: [
                  TextSpan(
                  text: " Masuk",
                  style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.black,
                   ),
                   recognizer: TapGestureRecognizer()..onTap = () => 
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MasukPenjual()))),
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
