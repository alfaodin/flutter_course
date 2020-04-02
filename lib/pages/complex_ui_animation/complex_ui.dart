import 'package:flutter/material.dart';

class ComplexUI extends StatefulWidget {
  ComplexUI({Key key}) : super(key: key);

  @override
  _ComplexUIState createState() => _ComplexUIState();
}

class _ComplexUIState extends State<ComplexUI> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyDrawer(),
        MyChild(),
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class MyChild extends StatefulWidget {
  const MyChild({Key key}) : super(key: key);

  @override
  _MyChildState createState() => _MyChildState();
}

class _MyChildState extends State<MyChild> with SingleTickerProviderStateMixin {
  final double maxSlide = 225;
  final double minDragStartEdge = 100;
  final double maxDragStartEdge = 300;

  bool _canBeDragged;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onTap: toggleAnimation,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (.3 * _animationController.value);
          return Transform(
            transform: Matrix4.identity()
              ..translate(slide)
              ..scale(scale),
            alignment: Alignment.centerLeft,
            child: Container(
              color: Colors.yellow,
            ),
          );
        },
      ),
    );
  }

  _onHorizontalDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;

    bool isDragOpenFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;
    _canBeDragged = isDragOpenFromLeft || isDragOpenFromRight;
  }

  _onHorizontalDragUpdate(DragUpdateDetails details) {
    print(details.primaryDelta);

    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;

      _animationController.value += delta;
      print(
          'valor calculado $delta y el animation Controller  $_animationController.value');
    }
  }

  _onHorizontalDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted)
      return;
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < .4) {
      _animationController.value = 0;
    } else if (_animationController.value > .7) {
      _animationController.value = 1;
    }
  }

  void toggleAnimation() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();
}
