import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/auth/auth_page.dart';
import 'package:mager_spot/app/pages/auth/masuk/pembeli/masuk_pembeli.dart';
import 'package:mager_spot/app/pages/auth/masuk/penjual/masuk_penjual.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainMasuk extends StatefulWidget {
  const MainMasuk({super.key});

  @override
  State<MainMasuk> createState() => _MainMasukState();
}

class _MainMasukState extends State<MainMasuk> {

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

              SizedBox(height: 67.h,),

               //Tombol back
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    child: IconButton(
                      onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => AuthPage()))),  
                      icon: Icon(
                      Icons.arrow_back_ios_new_rounded, 
                      color: ColorStyles.primaryBase,)
                    ),
                  ),
                ],
              ),

              SizedBox(height: 111.h,),

              Image.asset(
                "assets/logoWhite.png",
                width: 200.w,
                height: 204.h,
              ),
              SizedBox(height: 16.h,),

              //Slogan
              Text(
                "Temukan Semua yang Anda Butuhkan dalam Satu Aplikasi",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.primaryBase,
                ),
              ),
              SizedBox(height: 187.h,),
        
              //Button Daftar Penjual
              Buttons(
                text: "Masuk Sebagai Penjual", 
                colorBackground: ColorStyles.secondary,
                colorText: ColorStyles.primaryBase,
                width: mediaSize.width, 
                round: 12.r,
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => MasukPenjual()))), 
              ),

              SizedBox(height: 12.h),

              //Button Daftar Pembeli
              Buttons(
                text: "Masuk Sebagai Pembeli", 
                colorBackground: ColorStyles.primaryBase, 
                colorText: ColorStyles.secondary,
                width: mediaSize.width, 
                round: 12.r, 
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => MasukPembeli()))), 
              ),

              SizedBox(height: 64.h,)

        
          
            ],
          ),
        ),
      ),


    );
  }
}