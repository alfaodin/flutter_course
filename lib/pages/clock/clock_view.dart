import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  ClockView({Key key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);
    canvas.drawCircle(center, radius - 40, fillBrush);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var secBrush = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    //60seg 360 grados
    //1seg   Xgrados
    //1seg = 6grados
    var secHandX =
        centerX + cos(dateTime.second * 6 * pi / 180) * ((radius / 2));
    var secHandY =
        centerY + sin(dateTime.second * 6 * pi / 180) * ((radius / 2));

    canvas.drawLine(center, Offset(secHandX, secHandY), secBrush);

    var minBrush = Paint()
      ..shader = RadialGradient(
        colors: [
          Color(0xFF748ef6),
          Color(0xFF77DDFF),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    //60seg 360 grados
    //1seg   Xgrados
    //1seg = 6grados

    var minHandX =
        centerX + cos(dateTime.minute * 6 * pi / 180) * ((radius / 2) * .9);
    var minHandY =
        centerY + sin(dateTime.minute * 6 * pi / 180) * ((radius / 2) * .9);

    canvas.drawLine(center, Offset(minHandX, minHandY), minBrush);

    var hrBrush = Paint()
      ..shader = RadialGradient(
        colors: [
          Color(0xFFEA74AB),
          Color(0xFFC279FB),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      )
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var hourHandX = centerX +
        cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180) *
            ((radius / 2) * .7);
    var hourHandY = centerY +
        sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180) *
            ((radius / 2) * .7);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hrBrush);

    var centerBrush = Paint()..color = Color(0xFFEAECFF);
    canvas.drawCircle(center, 16, centerBrush);

    //------------------------
    var dashBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;

    for (var i = 0; i < 360; i += 30) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
