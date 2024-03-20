import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mager_spot/app/pages/auth/daftar/main_daftar.dart';
import 'package:mager_spot/app/pages/auth/daftar/pembeli/confirm_pembeli.dart';
import 'package:mager_spot/app/pages/auth/masuk/pembeli/masuk_pembeli.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/loading.dart';
import 'package:mager_spot/app/pages/widgets/snackbar.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/pages/widgets/text_fields_password.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/cubit/auth/auth_cubit.dart';

class DaftarPembeli extends StatefulWidget {
  const DaftarPembeli({super.key});

  @override
  State<DaftarPembeli> createState() => _DaftarPembeliState();
}

class _DaftarPembeliState extends State<DaftarPembeli> {

  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  bool isClickable = false;

  void checkClickable() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final nama = namaController.text.trim();
    setState(() {
      isClickable = email.isNotEmpty && password.isNotEmpty && nama.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
          backgroundColor: ColorStyles.primary,
          body:
           BlocConsumer<AuthCubit, AuthState>(
             listener: (context, state) {
               if (state is AuthSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const ConfirmPembeli())
                );
               } else if (state is AuthError) {
                showSnackBarWidget(context, state.error);
               }
             },
             builder: (context, state) {
              if (state is AuthLoading) {
                return const Loading();
              }
               return Stack(children: [
                       Positioned(top: 68, child: _buildAtas()),
                       Positioned(bottom: 0, child: _buildBawah())
                     ],
                   );
             },
           ),
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
            
            //Tombol back
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      child: IconButton(
                        onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => MainDaftar()))),  
                        icon: Icon(
                        Icons.arrow_back_ios_new_rounded, 
                        color: ColorStyles.primaryBase,)
                      ),
                    ),
                  ],
                ),
        
            Image.asset(
              "assets/logoWhiteDua.png",
              height: 200.h,
              width: 200.w,
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
          Text(
            "Selamat Datang!",
            style: GoogleFonts.nunito(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorStyles.black
            ),
          ),
          SizedBox(height: 26.h,),
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
                "Email",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),

          //Gaperlu Email UB
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
                "Kata Sandi",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),
          TextFieldsPassword(
            controller: passwordController, 
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
            text: "Daftar", 
            round: 24.r,
            colorBackground: ColorStyles.secondary,
            colorText: ColorStyles.primaryBase,
             onClicked: () {
                context.read<AuthCubit>().register(
                namaController.text, emailController.text, passwordController.text);
            },
            width: mediaSize.width
          ),

          SizedBox(height: 49.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(text: TextSpan(
              text: "Belum punya akun?",
                style: GoogleFonts.nunito(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ColorStyles.black,
                ),
                children: [
                  TextSpan(
                  text: " Masuk",
                  style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.black,
                   ),
                   recognizer: TapGestureRecognizer()..onTap = () => 
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MasukPembeli()))),
                  )
                 ]
                )
              ),
            ],
          ),




        ],
      ),
    );
  }



}
