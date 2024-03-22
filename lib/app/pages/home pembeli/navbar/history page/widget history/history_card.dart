import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/color_styles.dart';


class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 4,
      
      itemBuilder: (context, index) {       
       return Container(
          height: 94.h,
          width: 358.w,
          margin: EdgeInsets.symmetric(vertical: 8.h), 
          decoration: BoxDecoration(
          border: Border.all(color: ColorStyles.darkGrey),
          borderRadius: BorderRadius.circular(12.r),
          ),
        child: Padding(
            padding: EdgeInsets.all(12.w), 
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          //Gambar dari API
                          child: Image.asset(
                            "assets/magerSpot.png",
                            height: 64.h,
                            width: 64.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(width: 12.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        "Judul",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.pureBlack,
                          ),
                        ),
                        Text(
                          "User Id",
                          style: GoogleFonts.nunito(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 12.w,),
                        Text(
                          "Ini User Penjual",
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.darkGrey,
                          ),
                        ),
                        Text(
                          "Harga",
                          style: GoogleFonts.nunito(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: ColorStyles.secondary,
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 12.w,),
                        Text(
                          "tanggal pembelian",
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.pureBlack,
                          ),
                        )


                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );

      }
    );
  }
}