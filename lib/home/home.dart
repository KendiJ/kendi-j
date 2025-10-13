import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kendy_j/consts/dimentions.dart';
import 'package:kendy_j/consts/texts.dart';
import 'package:kendy_j/consts/app_data.dart'; 
import 'package:kendy_j/widgets/content_section.dart'; 

class HomePage extends StatelessWidget { 
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/doodles/iG1.png"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(Texts.intro, style: GoogleFonts.patrickHand(),),
              ),
              ContentSection(
                title: Texts.about,
                imagePath: "assets/doodles/iG2.png",
                bodyText: Texts.me,
              ),

              ContentSection(
                title: Texts.interests,
                imagePath: "assets/doodles/iG3.png",
                bodyText: Texts.interest,
              ),

              ContentSection(
                title: Texts.rest,
                imagePath: "assets/doodles/iG4.png",
                bodyText: Texts.cows,
              ),
              const SizedBox(height: kSectionSpacing),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: kSocialIcons.map((iconData) {
                    return IconButton(
                      onPressed: iconData.onPressed,
                      icon: Image.asset(
                        iconData.path,
                        width: kIconSize,
                        height: kIconSize,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: kSectionSpacing),
            ],
          ),
        ),
      ),
    );
  }
}