import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/detail%20homepage/category.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class CategoryCard extends StatelessWidget {

  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},

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