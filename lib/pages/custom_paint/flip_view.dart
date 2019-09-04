import 'dart:ui';

import 'package:flutter/material.dart';

class FlipView extends StatefulWidget {
  const FlipView({Key key}) : super(key: key);

  @override
  _FlipViewState createState() => _FlipViewState();
}

class _FlipViewState extends State<FlipView> {
  final _offsets = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flip book'),
      ),
      body: GestureDetector(
        onPanStart: (details) {
          print('pan start');
          setState(() {
            _offsets.add(details.localPosition);
          });
        },
        onPanUpdate: (details) {
          print('pan update');
          setState(() {
            _offsets.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          print('pan end');
          setState(() {
            _offsets.add(Offset(0, 0));
          });
        },
        child: Center(
          child: CustomPaint(
            painter: FlipBookPainter(_offsets),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //color: Colors.blue[100],
            ),
          ),
        ),
      ),
    );
  }
}

class FlipBookPainter extends CustomPainter {
  final offsets;

  FlipBookPainter(this.offsets) : super();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..isAntiAlias = true
      ..strokeWidth = 3;

    for (var offset in offsets) {
      canvas.drawPoints(PointMode.points, [offset], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
