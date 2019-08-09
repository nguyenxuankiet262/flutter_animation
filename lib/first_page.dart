import 'package:flutter/material.dart';
import 'package:flutter_animation/second_page_route.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  AnimationController _rotateController;
  AnimationController _slideController;
  Animation<Offset> _offsetFloat;
  List<String> _nameAnimation;
  var isHide = false;
  var isRotate = false;
  var isTranslate = false;
  var color = Colors.purple;
  var height = 100.0;
  var width = 100.0;
  var myOpacity = 1.0;
  var angle = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Slide Animation
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _offsetFloat = Tween<Offset>(begin: Offset.zero, end: Offset(3.0, 0.0))
        .animate(_slideController);

    //Roate Animation
    _rotateController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    //
    _nameAnimation = [
      "Scale",
      "Opacity",
      "Translate",
      "Hero",
      "Slide",
      "Rotate",
    ];
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Animation"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    left:
                        isTranslate ? MediaQuery.of(context).size.width / 3 : 0,
                    top: isTranslate ? 100 : 0,
                    child: Hero(
                        tag: "hero",
                        child: SlideTransition(
                            position: _offsetFloat,
                            child: AnimatedBuilder(
                              animation: _rotateController,
                              builder: (BuildContext context, Widget _widget) {
                                return new Transform.rotate(
                                  angle: _rotateController.value * 6.3,
                                  child: _widget,
                                );
                              },
                              child: AnimatedOpacity(
                                opacity: myOpacity,
                                duration: Duration(seconds: 1),
                                child: AnimatedContainer(
                                  color: color,
                                  height: height,
                                  width: width,
                                  curve: Curves.bounceIn,
                                  duration: Duration(seconds: 2),
                                ),
                              ),
                            )))),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 16),
              child: Wrap(
                children: _nameAnimation
                    .asMap()
                    .map((i, value) {
                      return MapEntry(
                          i,
                          Container(
                            margin: EdgeInsets.only(right: 8.0),
                            width: 100,
                            child: RaisedButton(
                              onPressed: () {
                                switch (i) {
                                  case 0:
                                    _scale();
                                    break;
                                  case 1:
                                    _fade();
                                    break;
                                  case 2:
                                    _translate();
                                    break;
                                  case 3:
                                    _hero();
                                    break;
                                  case 4:
                                    _slide();
                                    break;
                                  case 5:
                                    _rotate();
                                    break;
                                }
                              },
                              child: Text(
                                value,
                              ),
                            ),
                          ));
                    })
                    .values
                    .toList(),
              )),
          Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: _navigate,
                  child: Text("Navigate"),
                ),
              ))
        ],
      ),
    );
  }

  _slide() {
    if (isHide) {
      setState(() {
        isHide = !isHide;
      });
      _slideController.reverse();
    } else {
      setState(() {
        isHide = !isHide;
      });
      _slideController.forward();
    }
  }

  _rotate() {
    if (!isRotate) {
      _rotateController.forward();
      _rotateController.repeat();
      setState(() {
        isRotate = !isRotate;
      });
    } else {
      _rotateController.stop();
      setState(() {
        isRotate = !isRotate;
      });
    }
  }

  _scale() {
    setState(() {
      if (width == 100) {
        color = Colors.green;
        height *= 2;
        width *= 2;
      } else {
        color = Colors.blue;
        height = 100;
        width = 100;
      }
    });
  }

  _fade() {
    setState(() {
      if (myOpacity == 1.0) {
        myOpacity = 0.0;
      } else {
        myOpacity = 1.0;
      }
    });
  }

  void _hero() {
    Navigator.pushNamed(context, '/hero');
  }

  void _translate() {
    setState(() {
      isTranslate = !isTranslate;
    });
  }

  void _navigate() {
    Navigator.of(context).push(new SecondPageRoute());
  }
}
