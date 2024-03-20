import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/main_pembeli.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/search_bar.dart';
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      // itemCount: FoodPost.length,
      itemBuilder: (_, index) {
        return Container(
          color: ColorStyles.primary,
        );
      }
      );
  }
}