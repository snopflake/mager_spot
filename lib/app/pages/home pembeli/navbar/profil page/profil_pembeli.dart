import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mager_spot/app/pages/auth/daftar/main_daftar.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilPembeli extends StatefulWidget {
  const ProfilPembeli({super.key});

  @override
  State<ProfilPembeli> createState() => _ProfilPembeliState();
}

class _ProfilPembeliState extends State<ProfilPembeli> {

  late Size mediaSize;
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  bool isClickable = false;

  void checkClickable() {
    final nama = namaController.text.trim();
    final noTelp = noTelpController.text.trim();
    final email = emailController.text.trim();
    final alamat = alamatController.text.trim();
    setState(() {
      isClickable = nama.isNotEmpty && noTelp.isNotEmpty && email.isNotEmpty && alamat.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
          backgroundColor: ColorStyles.primary,
          body:
            Stack(children: [
            Positioned(top: 68, child: _buildAtas()),
            Positioned(bottom: 0, child: _buildBawah())
            ],
          )
      ),
    );

  }

  Widget _buildAtas() {

    return SizedBox(
      width: mediaSize.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column( 
          mainAxisSize: MainAxisSize.min,
          children: [
            
            //Tombol edit
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      child: IconButton(
                        onPressed: () {},  
                        icon: Icon(
                        Icons.edit, 
                        color: ColorStyles.primaryBase,)
                      ),
                    ),
                  ],
                ),

                //Input API User Profile
                Container(
                      width: 96.w,
                      height: 96.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/profile.png")),
                      ),
                    ),

                SizedBox(height: 12.h,),

                //Input API User
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "@user",
                      style: GoogleFonts.nunito(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.primaryBase
                      ),
                    )
                  ],
                ),
        
           
            SizedBox(height: 41.h)
          ],
        
        ),
      ),


    );
  }

  Widget _buildBawah() {

    return SizedBox(
      width: mediaSize.width.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
          )
        ),
        child: _buildForm(),
      ),
    );

  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, bottom: 66.h, left: 54.w, right: 54.w),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFields(
            controller: namaController,
            textInputType: TextInputType.name,
            text: "",
             onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "No. Telp",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),

          TextFields(
            controller: noTelpController,
            textInputType: TextInputType.name,
            text: "",
            onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
          ),

          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFields(
            controller: emailController, 
            textInputType: TextInputType.emailAddress, 
            text: "",
            onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
            ),

          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Alamat",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFields(
            controller: alamatController, 
            textInputType: TextInputType.name, 
            text: "",
            onChanged: (text) {
                setState(() {
                  checkClickable();
              });
             },
            ),

          //PPP TOMBOL DISINII
          SizedBox(height: 47.h,),
          Buttons(
            text: "Keluar", 
            round: 24.r,
            colorBackground: ColorStyles.secondary,
            colorText: ColorStyles.primaryBase,
            onClicked: () {},
            width: mediaSize.width
          ),

         



        ],
      ),
    );
  }



}
