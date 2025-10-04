import 'package:flutter/material.dart';
import 'package:kendy_j/consts/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/doodles/iG1.png"),
              Text(Texts.intro),
              Image.asset("assets/doodles/iG2.png"),
              Text("data"),
              Image.asset("assets/doodles/iG3.png"),
              Text("data"),
              Image.asset("assets/doodles/iG4.png"),
              Text("data"),

            ],
          ),
        ),
      ),
    );
  }
}