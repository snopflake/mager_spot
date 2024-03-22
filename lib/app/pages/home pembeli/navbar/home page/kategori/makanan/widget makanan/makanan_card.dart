import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/kategori/makanan/detail%20makanan/detail_makanan.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:mager_spot/data/models/makanan_model.dart';

class MakananCard extends StatefulWidget {
 
    final List<MakananModel> dummyData;

    MakananCard({
      required this.dummyData,
    });

  @override
  State<MakananCard> createState() => _MakananCardState();
}

class _MakananCardState extends State<MakananCard> {
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
      itemCount: widget.dummyData.length,
      itemBuilder: (context, index) {
        return InkWell(

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    DetailMakanan(data: widget.dummyData[index]),
              ),
            );
          },

          child: Container(
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
                 child: Image.network(widget.dummyData[index].foodPosts[index].pictureLink,
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
                        Text(widget.dummyData[index].foodPosts[index].title, 
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
                        //Input Harga
                        Text(widget.dummyData[index].foodPosts[index].price,
                          style: GoogleFonts.nunito(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorStyles.secondary
                          ),
                        ),
          
                        SizedBox(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.w.h,
                                ),
          
                              //Input Rating
                              Text(widget.dummyData[index].foodPosts[index].price,
                                  style: GoogleFonts.nunito(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.darkGrey
                                ),
                              )
                            ],
                          ),
                        ),
          
                         
          
          
                        
                      ],
                    ),
          
                    
                  ],
                ),
              )
              ],
            ),
          ),
        );
      }
      );
  }
}