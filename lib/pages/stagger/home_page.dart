import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page_enter_animation.dart';

class HomePage extends StatefulWidget {
  final HomePageEnterAnimation animation;

  HomePage({
    @required AnimationController controller,
  }) : animation = HomePageEnterAnimation(controller);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: widget.animation.controller,
          builder: (context, child) => _buildAnimation(context, child, size),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.animation.controller.reset();
            widget.animation.controller.forward();
          },
          tooltip: 'Increment Counter',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child, Size size) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 250,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              topBar(widget.animation.barHeight.value),
              circle(
                size,
                widget.animation.avatarSize.value,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Opacity(
                opacity: widget.animation.titleOpacity.value,
                child: placeholderBox(60, 100, Alignment.centerLeft),
              ),
              SizedBox(
                height: 8,
              ),
              Opacity(
                  opacity: widget.animation.textOpacity.value,
                  child: placeholderBox(200, 100, Alignment.centerRight))
            ],
          ),
        )
      ],
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue,
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 200,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1.0,
        ),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue.shade700),
        ),
      ),
    );
  }

  Align placeholderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green.shade300,
        ),
      ),
    );
  }
}
