import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/main_pembeli.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/kategori/makanan/widget%20makanan/makanan_card.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/widget%20homepage/search_bar.dart';
import 'package:mager_spot/app/pages/widgets/loading.dart';
import 'package:mager_spot/app/pages/widgets/snackbar.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:mager_spot/cubit/makanan/makanan_cubit.dart';
import 'package:mager_spot/data/models/makanan_model.dart';

class Makanan extends StatefulWidget {
  const Makanan({super.key});

  @override
  State<Makanan> createState() => _MakananState();
}

class _MakananState extends State<Makanan> {

    @override
    void initState() {
      context.read<MakananCubit>().getAllMakanan();
      super.initState();
    }


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
        child: SingleChildScrollView(
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
          
              SizedBox(height: 16.h),
          
              //Filter
              SizedBox(height: 26.h),
          
              SizedBox(height: 16,),

            BlocConsumer<MakananCubit, MakananState>(
            listener: (context, state) {
              if (state is GetMakananEror) {
                showSnackBarWidget(context, state.eror);
              }
            },
            builder: (context, state) {
              if (state is GetMakananLoading) {
                return const Loading();
              } else if (state is GetMakananSuccess) {
                return MakananCard(
                  dummyData: state.listMakananModel,
                );
              }
              return Center(
                child: Text("Belum ada postingan",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorStyles.darkGrey,
                ),
                ),
              );
            },
          ),


            ],
          ),
        ),
      ),
    );
  }
}

