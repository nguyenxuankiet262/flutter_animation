import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HeroPageState();
}

class HeroPageState extends State<HeroPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hero Page",
        ),
        centerTitle: true,
      ),
      body: Hero(
        tag: "hero",
        child: Container(
          height: 100,
          width: 100,
          color: Colors.purple,
        ),
      ),
    );
  }
}