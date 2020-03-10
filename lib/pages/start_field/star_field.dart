import 'dart:math';

import 'package:flutter/material.dart';

class StarField extends StatefulWidget {
  StarField({Key key}) : super(key: key);

  @override
  _StartFieldState createState() => _StartFieldState();
}

class _StartFieldState extends State<StarField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start field'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFFE83B),
                Color(0xFFF55336),
              ],
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Container(
              color: Colors.black,
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: StarFielPainter(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StarFielPainter extends CustomPainter {
  List<Star> _stars = new List<Star>();

  StarFielPainter() {
    for (var i = 0; i < 100; i++) {
      _stars.add(Star(300, 300));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.translate(size.width / 2, size.height / 2);
    for (var i = 0; i < _stars.length; i++) {
      _stars[i].update();
      _stars[i].show(canvas);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Star {
  double x;
  double y;
  double z;
  int width;
  int height;

  Star(int width, int height) {
    this.width = width;
    this.height = height;

    this.x = Random().nextInt(width).toDouble();
    this.y = Random().nextInt(height).toDouble();
    //this.z = Random().nextInt(width).toDouble();
    this.z = width.toDouble();
  }

  show(Canvas canvas) {
    double sx = width * (x / z);
    double sy = height * (y / z);

    canvas.drawCircle(Offset(sx, sy), 2, Paint()..color = Colors.white);
  }

  update() {
    z = z - 1;
  }
}
