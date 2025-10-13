import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kendy_j/consts/dimentions.dart'; 

class ContentSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final String bodyText;

  const ContentSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    // Basic responsiveness: Use fixed padding on very large screens,
    // otherwise use a percentage of the screen width for padding.
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 1200
        ? kDesktopContentPadding
        : screenWidth * 0.15; // 15% padding on smaller screens

    return Column(
      children: [
        const SizedBox(height: kSectionSpacing),
        Text(
          title,
          style: kTitleTextStyle, 
        ),
        Image.asset(imagePath),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(bodyText, style: GoogleFonts.patrickHand(),),
        ),
      ],
    );
  }
}