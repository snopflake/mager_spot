import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/main_pembeli.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/search_bar.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class Makanan extends StatelessWidget {
  const Makanan({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController makananController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 79.h,

        //Tombol Back
        leading: Container(
          width: 24.w,
          height: 24.h,
          child: IconButton(
            onPressed: () =>
             Navigator.push(context, MaterialPageRoute(builder: ((context) => MainPembeli()))),  
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorStyles.primaryBase,)),
        ),

        //Judul Appbar
        backgroundColor: ColorStyles.primary,
        title: Text("Makanan", 
          style: GoogleFonts.nunito(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorStyles.primaryBase
          )),
        centerTitle: true,
      ),

      //Body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h,),

            //SearchBar
            Center(
              child: SearchBarKu(
                controller: makananController, 
                text: "Cari makanan favoritmu!"
              ),
            ),
        
        
        
          ],
        ),
      ),
    );
  }

  
}