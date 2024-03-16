import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/home%20pembeli%20pages/detail%20homepage%20pembeli/category_card.dart';
import 'package:mager_spot/app/pages/widgets/search_bar.dart';
import 'package:mager_spot/app/styles/category.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class HomePagePembeli extends StatefulWidget {
  
  const HomePagePembeli({super.key});

  @override
  State<HomePagePembeli> createState() => _HomePagePembeliState();
}

final List<String> imagePaths = [
    "assets/carousel1.png",
    "assets/carousel2.png",
    "assets/carousel3.png",
];

late List<Widget> _pages;
int _activePage = 0;
final PageController _pageController = PageController(initialPage: 0);

Timer? _timer;

class _HomePagePembeliState extends State<HomePagePembeli> {

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        //Jika carousel di hal terakhir
        if(_pageController.page == imagePaths.length-1){
          _pageController.animateToPage(
            0, 
            duration: Duration(milliseconds: 500), 
            curve: Curves.easeInOut);
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500), 
            curve: Curves.easeInOut);
        }
      }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(imagePaths.length, (index) => ImagePlaceHolder(
      imagePath: imagePaths[index],
    ));
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {

  late Size mediaSize;
  mediaSize = MediaQuery.of(context).size;
  TextEditingController searchController = TextEditingController();
    
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 59,),
        
            //SearchBar + Wishlist
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SearchBarKu(
                    controller: searchController, 
                    text: "Cari produk, toko, atau kategori"),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.favorite_border_rounded,)
                  ),
                ],
              ),
            ),

            SizedBox(height: 16,),
            
            //Carousel
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: mediaSize.height / 4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imagePaths.length,
                    onPageChanged: (value) {
                      setState(() {
                        _activePage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                
                      // return image widget
                      return _pages[index];
                
                    },
                  ),
                ),
        
                //page indicator
                Positioned(
                  bottom: 34,
                  left: 74,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(children: 
                      List<Widget>.generate(_pages.length, (index) => 
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(
                                index, 
                                duration: Duration(milliseconds: 300), 
                                curve: Curves.easeIn
                                );
                            },
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: _activePage == index 
                              ? ColorStyles.primary 
                              : ColorStyles.darkGrey
                            ),
                          ),
                        )
                      )
                  
                     
                    ),
                  ),
                )
              ],
            ),
        
            SizedBox(height: 16,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16,),
                Text(
                  "Kategori", 
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.pureBlack,
                  )
                ),
              ],
            ),
        
            //Category
            GridView.builder(
              shrinkWrap: true,
              itemCount: categoryList.length,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ), 
                itemBuilder: (context, index){
                  return CategoryCard(
                    category: categoryList[index],
                  );
              }
            )
        
        
        
        
        
        
        ]),
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
      );
  }
}