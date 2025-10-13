import 'package:flutter/material.dart';
import 'package:kendy_j/utils/link_launcher.dart';

class SocialIconData {
  final String path;
  final String? url; 

  SocialIconData({required this.path, required this.url});

  VoidCallback get onPressed => () => launchURL(url!);

}

// Data list to be used in HomePage
final List<SocialIconData> kSocialIcons = [
  SocialIconData(path: 'assets/icons/iconY.png', url: 'https://www.youtube.com/@kendi_j'),
  SocialIconData(path: 'assets/icons/iconL.png', url: 'https://www.linkedin.com/in/kendij/'),
  SocialIconData(path: 'assets/icons/iconM.png', url: 'https://medium.com/@kendi_j'),
  SocialIconData(path: 'assets/icons/iconS.png', url: 'https://sessionize.com/kendi-jacqueline/'),
  SocialIconData(path: 'assets/icons/iconG.png', url: 'https://github.com/KendiJ'),
];