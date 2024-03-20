import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/kategori/barang.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/kategori/informasi_kos.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/kategori/makanan.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/kategori/ojek_online.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/category.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class CategoryCard extends StatelessWidget {

  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         if (category.name == "OJEK ONLINE") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OjekOnline()),
          );
        } else if (category.name == "MAKANAN") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Makanan()),
          );
        } else if (category.name == "INFORMASI KOS") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => InformasiKos()),
          );
        } else if (category.name == "BARANG") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Barang()),
          );
        }
      },

      child:  Container(
        padding: EdgeInsets.all(10.h.w),
        decoration: BoxDecoration(
          color: ColorStyles.lightGrey,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: ColorStyles.primary,
            width: .09.w,
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Image
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
                height: 150.h,
              ),
            ),

            SizedBox(height: 12.h,),

             //Text
             Center(
               child: Text(
                category.name,
               style: GoogleFonts.nunito(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorStyles.primary
               ),),
             )
          ],
        ),
      ),

    );
  }
}