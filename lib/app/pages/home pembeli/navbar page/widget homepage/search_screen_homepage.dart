import 'package:flutter/material.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/search_bar.dart';

class SearchScreenHomePage extends StatefulWidget {
  const SearchScreenHomePage({super.key});
  

  @override
  State<SearchScreenHomePage> createState() => _SearchScreenHomePageState();
}

class _SearchScreenHomePageState extends State<SearchScreenHomePage> {

  late Size mediaSize;

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaSize.height,
          width: mediaSize.width,
          child: Column(
            children: [

              //Search Bar
              Container(
                child: Padding(
                padding:EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded)),
                    SizedBox(width: 8),
                    SearchBarKu(
                      controller: searchController,
                      text: "Cari produk, toko, atau kategori")
                  
                  
                  ]),
                ),
              )
            ],
          ),


       )
      ),
    );
  }
}