import 'package:flutter/material.dart';

class PageViewIndicator extends StatefulWidget {
  final PageController controller;
  final int itemCout;
  final Color color;
  PageViewIndicator({
    Key key,
    @required this.controller,
    @required this.itemCout,
    @required this.color,
  }) : super(key: key);

  _PageViewIndicatorState createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: IndicatorPainter(
        4,
        widget.controller.page?.round() ?? -1,
        color: widget.color,
      ),
      child: Container(
        width: 60,
        height: 10,
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final Color color;
  final int length;
  final int currentIndicator;

  Paint dotPaint;
  static const double _SMALLDOT = 4;
  static const double _BIGDOT = 7;

  IndicatorPainter(this.length, this.currentIndicator,
      {this.color = Colors.black})
      : dotPaint = Paint()..color = color;

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircle(canvas, 0, Offset(30, size.height / 2));
    _drawCircle(canvas, 1, Offset((size.width / 3 + 10), size.height / 2));
    _drawCircle(canvas, 2, Offset((size.width / 3 + 10) * 2, size.height / 2));
    _drawCircle(canvas, 3, Offset(size.width + 10, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //print('# TIME OF PRINTING');
    return true;
  }

  _drawCircle(Canvas canvas, int indicator, Offset offset) {
    if (indicator == currentIndicator + 1) {
      Path path = Path();
      path.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, offset.dy - 3, 20, 6), Radius.circular(10)));

      dotPaint.color = Colors.deepOrange;
      canvas.drawPath(path, dotPaint);
      // canvas.drawCircle(offset, _BIGDOT, dotPaint);
    } else {
      dotPaint.color = this.color;
      canvas.drawCircle(offset, _SMALLDOT, dotPaint);
    }
  }
}
