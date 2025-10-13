// lib/utils/link_launcher.dart (or directly in home_page.dart)

import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  
  if (await canLaunchUrl(uri)) {
    // If the device can handle the URL scheme (e.g., http, https)
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Opens in the device's default browser
    );
  } else {
    // Handle the error (e.g., show a Snackbar to the user)
    // print('Could not launch $url'); 
    throw Exception('Could not launch $url');
  }
}