import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/history%20page/widget%20history/history_card.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/widget%20homepage/search_bar.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class HistoryPembeli extends StatefulWidget {
  const HistoryPembeli({super.key});

  @override
  State<HistoryPembeli> createState() => _HistoryPembeliState();
}

class _HistoryPembeliState extends State<HistoryPembeli> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [

            SizedBox(height: 64.h,),

            Center(
              child: Text(
                "Riwayat",
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorStyles.pureBlack,
                ),
              ),
            ),

            SizedBox(height: 24.h,),

            SearchBarKu(
              controller: searchController, 
              text: "Cari transaksi"),

            SizedBox(height: 24.h),

            HistoryCard(),

              



          ],
        ),
      ),


    );
  }
}