import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mager_spot/app/pages/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mager_spot/cubit/auth/auth_cubit.dart';
import 'package:mager_spot/cubit/makanan/makanan_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()..isHasLogin(),
        ),
        BlocProvider(
          create: (context) => MakananCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mager_Spot',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashPage(),
        ),
      ),
    );

  }
}
