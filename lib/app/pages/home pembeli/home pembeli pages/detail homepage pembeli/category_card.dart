import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/styles/category.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class CategoryCard extends StatelessWidget {

  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},

      child:  Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorStyles.lightGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ColorStyles.primary,
            width: .09,
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
                height: 150,
              ),
            ),

            SizedBox(height: 12,),

             //Text
             Center(
               child: Text(
                category.name,
               style: GoogleFonts.nunito(
                fontSize: 16,
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