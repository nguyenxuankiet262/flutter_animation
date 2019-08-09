import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/second_page.dart';

class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute()
      : super(builder: (BuildContext context) => new SecondPage());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new SecondPage());
  }
}