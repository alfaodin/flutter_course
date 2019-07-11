import 'package:flutter/widgets.dart';

class HomePageEnterAnimation {
  HomePageEnterAnimation(this.controller)
      : barheight = Tween<double>(begin: 0, end: 250).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              0.3,
              curve: Curves.easeIn,
            ),
          ),
        ),
        avatarSize = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              .6,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        titleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.6,
              .65,
              curve: Curves.easeIn,
            ),
          ),
        ),
        textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              .65,
              .8,
              curve: Curves.elasticOut,
            ),
          ),
        );

  final AnimationController controller;

  final Animation<double> barheight;
  final Animation<double> avatarSize;
  final Animation<double> textOpacity;
  final Animation<double> titleOpacity;
}
