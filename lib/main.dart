import 'package:flutter/material.dart';
import 'package:flutter_animation/first_page.dart';
import 'package:flutter_animation/hero_page.dart';
import 'package:flutter_animation/second_page.dart';
import 'package:flutter_animation/second_page_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/hero': (context) => HeroPage(),
      },
    );
  }
}
