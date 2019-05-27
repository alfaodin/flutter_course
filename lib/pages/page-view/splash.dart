import 'package:flutter/material.dart';

class Spash extends StatefulWidget {
  final Widget child;
  final GestureTapCallback onTap;

  Spash({Key key, this.child, this.onTap}) : super(key: key);

  _SpashState createState() => _SpashState();
}

class _SpashState extends State<Spash> with SingleTickerProviderStateMixin {
  static const double minRadius = 50;
  static const double maxRadius = 120;

  AnimationController animationController;
  Tween<double> radiusTween;
  Tween<double> borderTween;
  Animation<double> radiusAnimation;
  Animation<double> borderAnimation;
  AnimationStatus status;

  Offset _tapPosition;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((listener) => status = listener);

    radiusTween = Tween<double>(begin: 0, end: 50);
    radiusAnimation = radiusTween.animate(
        CurvedAnimation(curve: Curves.ease, parent: animationController));

    borderTween = Tween<double>(begin: 25, end: 1);
    borderAnimation = borderTween.animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        foregroundPainter: SplashPaint(
          radius: radiusAnimation.value,
          borderWidth: borderAnimation.value,
          status: status,
          tapPosition: _tapPosition,
        ),
        child: GestureDetector(
          child: widget.child,
          onTapUp: _onTapHandler,
        ),
      ),
    );
  }

  void _onTapHandler(TapUpDetails tapDetails) {
    RenderBox renderBox = context.findRenderObject();
    _tapPosition = renderBox.globalToLocal(tapDetails.globalPosition);

    double radius = renderBox.size.width > renderBox.size.height
        ? renderBox.size.width
        : renderBox.size.height;

    double constrainRadius;
    if (radius > maxRadius) {
      constrainRadius = maxRadius;
    } else if (radius < minRadius) {
      constrainRadius = minRadius;
    } else {
      constrainRadius = radius;
    }

    radiusTween.end = constrainRadius * .6;
    borderTween.begin = radiusTween.end / 2;
    borderTween.end = radiusTween.end * .01;

    print('TESTT');
    animationController.forward(from: 0);
    widget.onTap();
  }
}

class SplashPaint extends CustomPainter {
  final double radius;
  final double borderWidth;
  final AnimationStatus status;
  final Paint blackPaint;
  final Offset tapPosition;

  SplashPaint({
    @required this.radius,
    @required this.borderWidth,
    @required this.status,
    @required this.tapPosition,
  }) : blackPaint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (status == AnimationStatus.forward) {
      canvas.drawCircle(tapPosition, radius, blackPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
