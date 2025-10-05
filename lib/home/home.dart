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
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/doodles/iG1.png"),
              Text(Texts.intro),
              SizedBox(height: 150),
              Text(
                Texts.about,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 80
                ),
              ),
              Image.asset("assets/doodles/iG2.png"),
              Container(
                padding: EdgeInsets.fromLTRB(200, 0, 200, 0),
                child: Text(Texts.me),
              ),
              SizedBox(height: 150),
              Text(
                Texts.still,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 80
                ),
              ),
              Image.asset("assets/doodles/iG3.png"),
              Text(Texts.interest),
              SizedBox(height: 150),
              Text(
                Texts.rest,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 80
                ),
              ),
              Image.asset("assets/doodles/iG4.png"),
              Text(Texts.cows),
              SizedBox(height: 150),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.abc_outlined))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
