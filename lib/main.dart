import 'package:flutter/material.dart';
import 'package:kendy_j/home/home.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Arial",
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 30),
        ),
      ),
      home: HomePage(),
    );
  }
}
