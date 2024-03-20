import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/category_card.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/search_screen_homepage.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/search_bar.dart';
import 'package:mager_spot/app/pages/home%20pembeli/navbar%20page/widget%20homepage/category.dart';
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
            SizedBox(height: 59.h,),
        
            //SearchBar + Wishlist
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                children: [

                  InkWell(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchScreenHomePage())));
                    },

                    child: SearchBarKu(
                      controller: searchController, 
                      text: "Cari produk, toko, atau kategori"),
                  ),


                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.favorite_border_rounded,)
                  ),

                ],
              ),
            ),

            SizedBox(height: 16.h,),
            
            //Carousel
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: mediaSize.height.h / 4,
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
                  bottom: 34.h,
                  left: 74.w,
                  right: 0.w,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(children: 
                      List<Widget>.generate(_pages.length, (index) => 
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(
                                index, 
                                duration: Duration(milliseconds: 300), 
                                curve: Curves.easeIn
                                );
                            },
                            child: CircleAvatar(
                              radius: 4.r,
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
        
            SizedBox(height: 16.h,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16.w,),
                Text(
                  "Kategori", 
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
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
                horizontal: 20.w,
                vertical: 8.h,
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
      );
  }
}