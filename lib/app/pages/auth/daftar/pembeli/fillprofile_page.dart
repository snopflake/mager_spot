import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mager_spot/app/pages/home%20pembeli/main_pembeli.dart';
import 'package:mager_spot/app/pages/widgets/buttons.dart';
import 'package:mager_spot/app/pages/widgets/text_fields.dart';
import 'package:mager_spot/app/styles/color_styles.dart';

class FillProfilePage extends StatefulWidget {
  const FillProfilePage({super.key});

  @override
  State<FillProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillProfilePage> {

  TextEditingController usernameController= TextEditingController();
  TextEditingController noTelpController= TextEditingController();
  TextEditingController alamatController= TextEditingController();

  bool isClickable = false;

  void checkClickable() {
    final username = usernameController.text.trim();
    final noTelp = noTelpController.text.trim();
    final alamat = alamatController.text.trim();
    setState(() {
      isClickable = username.isNotEmpty && noTelp.isNotEmpty && alamat.isNotEmpty;
    });
  }

  late Size mediaSize;

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 0, bottom:  0,left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 43),

              //lewati
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(text: TextSpan(
                      text: "Lewati",
                      style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorStyles.secondary,
                       ),
                       recognizer: TapGestureRecognizer()..onTap = () => 
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => MainPembeli()))),
                      )),
                ],
              ),

              SizedBox(height: 18,),

              Text(
                "Setelah Anda berhasil mendaftar, jangan lupa untuk melengkapi profil Anda sebelum melanjutkan.",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorStyles.black,
                  ),
              ),
          
              SizedBox(height: 40),
          
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/profile.png")),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: ColorStyles.primaryBase,
                        ),
                        color: ColorStyles.primary
                      ),
                      child: Center(child: Icon(Icons.add, color: ColorStyles.primaryBase,)),
          
                    )),
                  ],
                ),
              ),
          
              SizedBox(height: 40,),
          
              Padding(
                padding: EdgeInsets.only(top: 0, bottom:  0,left: 48, right: 48),
                child: Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black,
                        ),
                      ),
                    ],
                    ),
                    TextFields(
                    controller: usernameController,
                    textInputType: TextInputType.emailAddress,
                    text: "",
                    onChanged: (text) {
                      setState(() {
                        checkClickable();
                        });
                      },
                    ),
                              
                    SizedBox(height: 16),
                              
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "No Telp",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
                              
                    SizedBox(height: 16),
                              
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
                              
                    SizedBox(height: 130),
                    
                    //Buttons disini
                    Buttons(
                      text: "Simpan", 
                      colorBackground: ColorStyles.secondary,
                      colorText: ColorStyles.primaryBase,
                      width: mediaSize.width, 
                      round: 24,
                      onClicked: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => MainPembeli()))
                    )),
                  ],
                ),
              )
          
          
          
          
          
          
          
          
          
            
            
            ]),
        ),
        
        ),
        


    );
  }
}