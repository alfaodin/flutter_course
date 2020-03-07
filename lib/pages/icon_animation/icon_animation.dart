import 'package:flutter/material.dart';

class IconAnimation extends StatefulWidget {
  IconAnimation({Key key}) : super(key: key);

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with SingleTickerProviderStateMixin  {
  double iconSize = 0.0;
  double maxIconSize = 20;
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAnimation(),
      ),
    );
  }

  Widget _content() {
    return SafeArea(
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey,
          child: Icon(
            Icons.insert_emoticon,
            size: 30 + iconSize,
          ),
        ),
      ),
    );
  }

  _startAnimation() {
    final Animation curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn);

    _animation = Tween<double>(begin: 0, end: 1).animate(curve)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _controller.reverse();
        }
      })
      ..addListener(() {
        setState(() {
          iconSize = maxIconSize * _animation.value;
        });
      });
    _controller.forward();
  }
}
