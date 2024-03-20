import 'package:flutter/material.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/history%20page/history_pembeli.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/home%20page/homepage_pembeli.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar/profil%20page/profil_pembeli.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class MainPembeli extends StatefulWidget {
  
  const MainPembeli({super.key});

  @override
  State<MainPembeli> createState() => _MainPembeliState();
}

class _MainPembeliState extends State<MainPembeli> {

  int index = 0;

  final screens = [
    HomePagePembeli(),
    HistoryPembeli(),
    ProfilPembeli(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[index],

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorStyles.primaryBase
            )
          )
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
          child: NavigationBar(
            height: 80,
            backgroundColor: ColorStyles.primary,
            indicatorColor: ColorStyles.primary,
            selectedIndex: index,
          
            onDestinationSelected: (index) => 
              setState(() => this.index = index),
          
            destinations: [
              
              //HomePage
              NavigationDestination(
                icon: Icon(
                  Icons.home_rounded, 
                  color: ColorStyles.primaryBase,
                  size: 26), 
                selectedIcon: Icon(
                  Icons.home_rounded, 
                  color: ColorStyles.secondary,
                  size: 26,),
                label: "Beranda"),
          
              //History
              NavigationDestination(
                icon: Icon(
                  Icons.history, 
                  color: ColorStyles.primaryBase,
                  size: 26,), 
                selectedIcon: Icon(
                  Icons.history, 
                  color: ColorStyles.secondary, 
                  size: 26,),
                label: 'Riwayat'),
          
                //Profil
                NavigationDestination(
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: ColorStyles.primaryBase,
                  size: 26,),
                selectedIcon: Icon(
                  Icons.person_outline_rounded,
                  color: ColorStyles.secondary,
                  size: 26,), 
                label: 'Profil')
          
            ],
          
            
          ),
        ),
      ),

    );
  }

  
}