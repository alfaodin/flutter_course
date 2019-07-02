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
    print('Veamos que valor tenemos en currentPAge ' +
        widget.controller.page?.round().toString());
    return CustomPaint(
      foregroundPainter: IndicatorPainter(
        4,
        widget.controller.page?.round() ?? 0,
        color: widget.color,
      ),
      child: Container(
        width: 100,
        height: 20,
        color: Colors.green,
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final Color color;
  final int length;
  final int currentIndicator;

  Paint dotPaint;
  static const double _SMALLDOT = 5;
  static const double _BIGDOT = 8;

  IndicatorPainter(this.length, this.currentIndicator,
      {this.color = Colors.black})
      : dotPaint = Paint()..color = color;

  @override
  void paint(Canvas canvas, Size size) {
    final double spaceBetween = size.width / (length + 1);

    dotPaint.color = Colors.blue.withOpacity(0.5);
    dotPaint.strokeWidth = 0;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), dotPaint);

    // _drawCircle(canvas, 0, Offset(spaceBetween, size.height / 2));
    // _drawCircle(canvas, 1, Offset(spaceBetween * 2, size.height / 2));
    _drawCircle(canvas, 2, Offset(spaceBetween * 3, size.height / 2));
    //_drawCircle(canvas, 3, Offset(spaceBetween * 4, size.height / 2));

    dotPaint.color = Colors.deepOrange;
    canvas.drawRRect(
        RRect.fromLTRBR(10, 5, 50, 15, Radius.circular(3)), dotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    print('# TIME OF PRINTING');
    return true;
  }

  _drawCircle(Canvas canvas, int indicator, Offset offset) {
    print('Mi indice $indicator pagina seleccionada $currentIndicator');
    if (indicator == currentIndicator) {
      dotPaint.color = Colors.deepOrange;

      canvas.drawRRect(
          RRect.fromLTRBR(20, 6, 40, 10, Radius.circular(0)), dotPaint);
    } else {
      dotPaint.color = this.color;
      canvas.drawCircle(offset, _SMALLDOT, dotPaint);
    }
  }
}
