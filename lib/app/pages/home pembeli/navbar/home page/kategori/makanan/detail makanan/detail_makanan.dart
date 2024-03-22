import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/kategori/makanan/makanan.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:mager_spot/data/models/makanan_model.dart';

class DetailMakanan extends StatefulWidget {

  final MakananModel data;

  const DetailMakanan({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailMakanan> createState() => _DetailMakananState();
}

class _DetailMakananState extends State<DetailMakanan> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 79.h,

        //Tombol Back
        leading: Container(
          width: 24.w,
          height: 24.h,
          child: IconButton(
            onPressed: () =>
             Navigator.push(context, MaterialPageRoute(builder: ((context) => Makanan()))),  
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorStyles.primaryBase,)),
        ),

        //Judul Appbar
        backgroundColor: ColorStyles.primary,
        title: Text("Detail Makanan", 
          style: GoogleFonts.nunito(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorStyles.primaryBase
          )),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
        
              SizedBox(height: 16.h),
        
              //Input Gambar
              Image.asset(
                "assets/magerSpot.png",
                width: 358.w,
                height: 358.h,
              ),
        
              SizedBox(height: 12.h,),
        
              //Input Judul
              Text(
                "Judul Makanan",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: ColorStyles.pureBlack
                ),
              ),
        
              SizedBox(height: 8.h,),
        
              //Input Harga
              Text(
                "Rp Harga",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                  color: ColorStyles.secondary,
                ),
              ),
        
              SizedBox(height: 12.h,),
        
              //Input Body
              Text(
                "Ini Body",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.darkGrey
                ),
              ),
        
              SizedBox(height: 12.h,),
        
              SizedBox(
                child: Row(
                  children: [
        
                    //Input Gambar User Penjual
                    Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/profile.png")),
                        ),
                    ),
        
                    SizedBox(width: 11.w,),
        
                    //Input Nama User Penjual
                    Text(
                      "Ini User Penjual",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: ColorStyles.black
                      ),
                    ),
        
                  ],
                ),
              ),
        
              SizedBox(height: 12.h,),
        
              Text(
                "Komentar",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                  color: ColorStyles.pureBlack,
                ),
              ),
        
              SizedBox(height: 12.h,),
        
              SizedBox(
                child: Row(
                  children: [
        
                    //Input Gambar User Pembeli
                    Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/profile.png")),
                        ),
                    ),
        
                    SizedBox(width: 11.w,),
        
                    //Input Nama User Pembeli
                    //Input Komentar Pembeli
                    Column(
                      children: [
                        Text(
                          "Ini User Penjual",
                          style: GoogleFonts.heebo(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: ColorStyles.black
                          ),
                        ),
        
                        Text(
                          "Ini Komentar Pembeli",
                          style: GoogleFonts.nunito(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.darkGrey,
                          ) ,
                        )
                      ],
                    ),

                    SizedBox(height: 23.h,),

                    //Tombol wishlist
                    //Tombol whatsapp
                    //Tombol pesan
        
                  ],
                ),
              ),
        
        
        
        
        
        
        
            ],
          ),
        ),
      ),




    );
  }
}