import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Second Page"
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}