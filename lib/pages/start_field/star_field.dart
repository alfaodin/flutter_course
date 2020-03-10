import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StarField extends StatefulWidget {
  StarField({Key key}) : super(key: key);

  @override
  _StartFieldState createState() => _StartFieldState();
}

class _StartFieldState extends State<StarField> {
  Ticker _ticker;
  List<Star> _stars = new List<Star>();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 1; i++) {
      _stars.add(Star(300, 300));
    }

    _ticker = new Ticker(_handleStarTick)..start();
  }

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
                painter: StarFielPainter(_stars),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleStarTick(Duration elapsed) {
    setState(() {
      // advanceStars(widget.starSpeed);
    });
  }

  void advanceStars(double distance) {
    // _stars.forEach((s) {
    //   //Move stars on the z, and reset them when they reach the viewport
    //   s.z -= distance; // * elapsed.inMilliseconds;
    //   if (s.z < _minZ) {
    //     _randomizeStar(s, false);
    //   } else if (s.z > _maxZ) {
    //     s.z = _minZ;
    //   }
    // });
  }
}

class StarFielPainter extends CustomPainter {
  final List<Star> _stars;

  StarFielPainter(this._stars);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
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
  double width;
  double height;

  Star(int width, int height) {
    this.width = width.toDouble();
    this.height = height.toDouble();
    randomizeStar();
  }

  show(Canvas canvas) {
    double sx = transform(x / z, 0, 1, 0, width);
    double sy = transform(y / z, 0, 1, 0, height);

    canvas.drawCircle(Offset(sx, sy), 2, Paint()..color = Colors.white);
  }

  randomizeStar() {
    this.x = (-width / 2) + Random().nextInt(width.toInt()).toDouble();
    this.y = (-height / 2) + Random().nextInt(height.toInt()).toDouble();
    this.z = Random().nextInt(width.toInt()).toDouble();
  }

  update() {
    z = z - 0.01;

    if ((x.abs() + z.abs()) > (this.width / 2) ||
        (y.abs() + z.abs()) > (this.height / 2)) {
      randomizeStar();
    }
  }

  transform(
      double n, double start1, double stop1, double start2, double stop2) {
    var newval = (n - start1) / (stop1 - start1) * (stop2 - start2) + start2;
    return newval;
  }
}
