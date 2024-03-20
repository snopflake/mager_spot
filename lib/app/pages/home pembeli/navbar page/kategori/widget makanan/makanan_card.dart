import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/main_pembeli.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/search_bar.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class MakananCard extends StatelessWidget {
  const MakananCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:  const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      // itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          color: ColorStyles.primary,
        );
      }
      );
  }
}