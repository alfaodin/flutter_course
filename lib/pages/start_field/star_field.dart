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

    for (var i = 0; i < 100; i++) {
      _stars.add(Star(300, 300));
    }

    _ticker = new Ticker(_handleStarTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
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
    setState(() {});
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

    canvas.drawCircle(Offset(-size.width / 2, -size.height / 2), 10,
        Paint()..color = Colors.redAccent);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10,
        Paint()..color = Colors.redAccent);
    canvas.drawCircle(Offset(0, 0), 10, Paint()..color = Colors.redAccent);
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
  double pz;
  double width;
  double height;

  Star(int width, int height) {
    this.width = width.toDouble();
    this.height = height.toDouble();
    randomizeStar();
  }

  show(Canvas canvas) {
    double sx = transform(x / z, 0, 1, 0, width / 2);
    double sy = transform(y / z, 0, 1, 0, height / 2);

    double r = transform(z, 0, width, 4, 0);

    canvas.drawCircle(Offset(sx, sy), r, Paint()..color = Colors.white);

    double px = transform(x / pz, 0, 1, 0, width / 2);
    double py = transform(y / pz, 0, 1, 0, height / 2);
    canvas.drawLine(
        Offset(px, py), Offset(sx, sy), Paint()..color = Colors.white);
  }

  randomizeStar() {
    this.x = randomRange(-width ~/ 2, width ~/ 2).toDouble();
    this.y = randomRange(-width ~/ 2, width ~/ 2).toDouble();
    this.z = Random().nextInt(width.toInt()).toDouble();
    this.pz = this.z;
  }

  update() {
    z = z - 2;
    pz = pz - .8;

    if ((z / 10) <= 1) {
      randomizeStar();
    }
  }

  transform(
      double n, double start1, double stop1, double start2, double stop2) {
    var newval = (n - start1) / (stop1 - start1) * (stop2 - start2) + start2;
    return newval;
  }

  int randomRange(int min, int max) {
    Random rnd;
    rnd = new Random();
    int result = min + rnd.nextInt(max - min);
    return result;
  }
}
