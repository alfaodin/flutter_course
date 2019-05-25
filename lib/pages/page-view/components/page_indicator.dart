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
    _drawCircle(canvas, 0, Offset(0, size.height / 2));
    _drawCircle(canvas, 1, Offset(size.width / 3, size.height / 2));
    _drawCircle(canvas, 2, Offset(size.width / 3 * 2, size.height / 2));
    _drawCircle(canvas, 3, Offset(size.width, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //print('# TIME OF PRINTING');
    return true;
  }

  _drawCircle(Canvas canvas, int indicator, Offset offset) {
    if (indicator == currentIndicator + 1) {
      // Rect rect = Rect.fromPoints( (center: offset, radius: 1);
      // canvas.drawRect(rect, dotPaint);
      canvas.drawCircle(offset, _BIGDOT, dotPaint);
    } else {
      canvas.drawCircle(offset, _SMALLDOT, dotPaint);
    }
  }
}
