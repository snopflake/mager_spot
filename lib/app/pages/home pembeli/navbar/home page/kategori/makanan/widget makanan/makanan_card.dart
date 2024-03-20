import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:mager_spot/data/models/makanan_model.dart';

class MakananCard extends StatelessWidget {
   final String judul;
   final String harga;
    final String rating;
    final String gambar;
    MakananCard({
      required this.judul,
      required this.harga,
      required this.rating,
      required this.gambar,
    });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:  const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //pecah jadi dua
        crossAxisCount: 2, 
        //jarak ke samping
        crossAxisSpacing: 20.w,
        //jarak ke bawah
        mainAxisSpacing: 20.h,
        //height
        mainAxisExtent: 200.h,
        ), 

      //Jumlah dari API
      itemCount: 4,

      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: ColorStyles.lightGrey,
            boxShadow: [BoxShadow(
              color: ColorStyles.darkGrey,
              blurRadius: 3.0,
              spreadRadius: 0,
            )]
            
          ),
          child: Column(
            children: [
             ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r)),

              //Input gambar dri API
               child: Image.asset("assets/Mager.png",
               height: 154.h,
               width: double.infinity.w,
               fit: BoxFit.cover,
               ),
             ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 4.h, 12.w, 8.h),
              child: Column(
                children: [

                  //Input Judul
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Makanan", 
                        style: GoogleFonts.nunito(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.pureBlack
                        ),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //Input Rating
                      Text("Harga",
                        style: GoogleFonts.nunito(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.secondary
                        ),
                      ),

                      Container(
                        width: 8.w,
                        height: 8.h,
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                          ),
                      ),

                      //Input Rating
                      Text("rating",
                        style: GoogleFonts.nunito(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.darkGrey
                        ),
                      )
                    ],
                  ),

                  
                ],
              ),
            )
            ],
          ),
        );
      }
      );
  }
}