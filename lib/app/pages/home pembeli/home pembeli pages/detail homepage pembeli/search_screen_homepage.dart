import 'package:flutter/material.dart';

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