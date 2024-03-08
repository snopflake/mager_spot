import 'dart:async';
import 'package:mager_spot/app/pages/login_page.dart';
import 'package:mager_spot/app/styles/color_styles.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => LoginPage())));

     });
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logoWhite.png",
              width: 200, 
              height: 204,
              )

         ],
        ),
      ),
    );
  }
}
