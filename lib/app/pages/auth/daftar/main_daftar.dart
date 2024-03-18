import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/auth/auth_page.dart';
import 'package:mager_spot/app/pages/auth/daftar/pembeli/daftar_pembeli.dart';
import 'package:mager_spot/app/pages/auth/daftar/penjual/daftar_penjual.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDaftar extends StatefulWidget {
  const MainDaftar({super.key});

  @override
  State<MainDaftar> createState() => _MainDaftarState();
}

class _MainDaftarState extends State<MainDaftar> {

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
                "Bergabunglah dengan Magerspot!",
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.primaryBase,
                ),
              ),
              SizedBox(height: 210.h,),
        
              //Button Daftar Penjual
              Buttons(
                text: "Daftar Sebagai Penjual", 
                colorBackground: ColorStyles.secondary,
                colorText: ColorStyles.primaryBase,
                width: mediaSize.width.w, 
                round: 12.r,
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => DaftarPenjual()))), 
              ),

              SizedBox(height: 12.h,),

              //Button Daftar Pembeli
              Buttons(
                text: "Daftar Sebagai Pembeli", 
                colorBackground: ColorStyles.primaryBase, 
                colorText: ColorStyles.secondary,
                width: mediaSize.width.w, 
                round: 12.r, 
                onClicked: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) => DaftarPembeli())))
              ),

              SizedBox(height: 64.h,)

        
          
            ],
          ),
        ),
      ),


    );
  }
}