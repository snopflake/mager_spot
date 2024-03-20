import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mager_spot/app/pages/auth/daftar/pembeli/confirm_pembeli.dart';
import 'package:mager_spot/app/pages/auth/daftar/pembeli/daftar_pembeli.dart';
import 'package:mager_spot/app/pages/auth/masuk/main_masuk.dart';
import 'package:mager_spot/app/pages/home%20pembeli/main_pembeli.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/buttons_image.dart';
import 'package:mager_spot/app/pages/widgets/loading.dart';
import 'package:mager_spot/app/pages/widgets/snackbar.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/pages/widgets/text_fields_password.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mager_spot/cubit/auth/auth_cubit.dart';

class MasukPembeli extends StatefulWidget {
  const MasukPembeli({super.key});

  @override
  State<MasukPembeli> createState() => _MasukPembeliState();
}

class _MasukPembeliState extends State<MasukPembeli> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isClickable = false;

  void checkClickable() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    setState(() {
      isClickable = email.isNotEmpty && password.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        backgroundColor: ColorStyles.primary,
        body: BlocConsumer<AuthCubit, AuthState>(
         listener: (context, state) {
          if (state is AuthSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const MainPembeli())
                );
               } else if (state is AuthError) {
                showSnackBarWidget(context, state.error);
               }
             },
             builder: (context, state) {
              if (state is AuthLoading) {
                return const Loading();
              }
            return Stack(
              children: [
                Positioned(top: 58, child: _buildAtas()),
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
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MainMasuk()))),
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: ColorStyles.primaryBase,
                      )),
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
      width: mediaSize.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        )),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 66, left: 54, right: 54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Selamat Datang Kembali!",
            style: GoogleFonts.nunito(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: ColorStyles.black),
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.black,
                ),
              ),
            ],
          ),

          //Bukan Akun UB
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

          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Kata Sandi",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
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
          SizedBox(height: 8.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                  text: TextSpan(
                text: "Lupa password?",
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.darkGrey,
                ),
              )),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),

          // PPP TOMBOL DISINIII
          Buttons(
            text: "Masuk",
            colorBackground: ColorStyles.secondary,
            colorText: ColorStyles.primaryBase,
            width: mediaSize.width,
            round: 24.r,
            onClicked: () {
                context
                    .read<AuthCubit>()
                    .login(emailController.text, passwordController.text);
              },
          ),

          SizedBox(
            height: 24.h,
          ),
          Text(
            "atau masuk dengan",
            style: GoogleFonts.nunito(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: ColorStyles.black,
            ),
          ),
          SizedBox(height: 20.h),

          //Button Image
          Row(
            children: [
              ButtonsImage(
                  text: "Google",
                  width: 122.w,
                  image: "assets/googleLogo.png",
                  onClicked: () {}),
              SizedBox(width: 15.h),
              ButtonsImage(
                  text: "Facebook",
                  width: 122.w,
                  image: "assets/facebookLogo.png",
                  onClicked: () {})
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Belum punya akun?",
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.black,
                      ),
                      children: [
                    TextSpan(
                      text: " Daftar",
                      style: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorStyles.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DaftarPembeli()))),
                    )
                  ])),
            ],
          ),
        ],
      ),
    );
  }
}
