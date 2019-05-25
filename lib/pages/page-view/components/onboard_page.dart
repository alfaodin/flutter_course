import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'package:hello_world/pages/page-view/drawer-paint.dart';
import 'package:hello_world/pages/page-view/model/onboard-page-model.dart';
import 'package:hello_world/pages/page-view/providers/color_provider.dart';

import 'package:provider/provider.dart';

class OnboardPageState extends StatefulWidget {
  final OnboardPageModel pageModel;
  final PageController pageController;

  const OnboardPageState(
      {Key key, @required this.pageController, @required this.pageModel})
      : super(key: key);

  @override
  _OnboardPageStateState createState() => _OnboardPageStateState();
}

class _OnboardPageStateState extends State<OnboardPageState>
    with SingleTickerProviderStateMixin {
  Animation<double> heroAnimation;
  Animation<double> borderAnimation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    borderAnimation = Tween<double>(begin: 75, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    animationController.forward(from: 0);
    super.initState();
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: widget.pageModel.primeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnimatedBuilder(
                animation: heroAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(heroAnimation.value, 0),
                    child: Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Image.asset(widget.pageModel.imagePath),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.pageModel.caption,
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  widget.pageModel.accentColor.withOpacity(.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.pageModel.subhead,
                          style: TextStyle(
                              fontSize: 32,
                              color: widget.pageModel.accentColor,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.pageModel.description,
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  widget.pageModel.accentColor.withOpacity(.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: borderAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: DrawerPaint(curveColor: widget.pageModel.accentColor),
                child: Container(
                  width: borderAnimation.value,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: widget.pageModel.primeColor,
                        iconSize: 32,
                        onPressed: _nexButtonPressed,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void _nexButtonPressed() {
    Provider.of<ColorProvider>(context).color =
        widget.pageModel.nextAccentColor;
    widget.pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
}
