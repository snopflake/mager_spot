import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/auth/daftar/main_daftar.dart';
import 'package:mager_spot/app/pages/auth/masuk/main_masuk.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 210.h,),
              Image.asset(
                "assets/logoWhite.png",
                width: 200.w,
                height: 204.h,
              ),
              SizedBox(height: 17.h,),

              //Slogan
              Text(
                "Platform All-in-One untuk Kebutuhan Anda",
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.primaryBase,
                ),
              ),
              SizedBox(height: 210.h,),
        
              //Button Daftar
              Buttons(
                text: "Daftar", 
                colorBackground: ColorStyles.secondary,
                colorText: ColorStyles.primaryBase,
                width: mediaSize.width.w, 
                round: 12.r,
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => MainDaftar()))),
              ),

              SizedBox(height: 12.h,),

              //Button Masuk
              Buttons(
                text: "Masuk", 
                colorBackground: ColorStyles.primaryBase, 
                colorText: ColorStyles.secondary,
                width: mediaSize.width.w, 
                round: 12.r, 
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => MainMasuk()))),
              ),

              SizedBox(height: 64.h),


          
            ],
          ),
        ),
      ),


    );
  }
}