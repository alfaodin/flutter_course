import 'dart:math';

import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';

class IconAnimation extends StatefulWidget {
  IconAnimation({Key key}) : super(key: key);

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with SingleTickerProviderStateMixin {
  double iconSize = 0.0;
  double maxIconSize = 20;
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAnimation(),
      ),
    );
  }

  Widget _content() {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          PixelNoise(
            color: Colors.deepOrangeAccent,
          ),
          Center(
            child: Container(
              color: Colors.blueGrey,
              child: Icon(
                Icons.insert_emoticon,
                size: 30 + iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _startAnimation() {
    final Animation curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn);

    _animation = Tween<double>(begin: 0, end: 1).animate(curve)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _controller.reverse();
        }
      })
      ..addListener(() {
        setState(() {
          iconSize = maxIconSize * _animation.value;
        });
      });
    _controller.forward();
  }
}

class PixelNoise extends StatefulWidget {
  final Color color;

  PixelNoise({Key key, this.color = Colors.white}) : super(key: key);

  @override
  _PixelNoiseState createState() => _PixelNoiseState();
}

class _PixelNoiseState extends State<PixelNoise>
    with SingleTickerProviderStateMixin {
  PerlinNoise _perlinNoise;

  @override
  void initState() {
    var random = Random();

    _perlinNoise = PerlinNoise(
      octaves: 4,
      frequency: 0.15,
      seed: random.nextInt(1337),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: CustomPaint(
        painter: NoisePointer(
          _perlinNoise,
          color: Colors.deepPurpleAccent,
          pixelSize: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class NoisePointer extends CustomPainter {
  final Color color;
  final double pixelSize;
  final double blockSize;
  final PerlinNoise _perlinNoise;

  static const _max = sqrt1_2;
  static const _min = -_max;

  NoisePointer(this._perlinNoise,
      {@required this.color, @required this.pixelSize})
      : this.blockSize = pixelSize * 1.4;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    for (var x = 0.0; x < size.width / blockSize; x++) {
      for (var y = 0.0; y < size.height / blockSize; y++) {
        var noise = _perlinNoise.getPerlin2(x, y);
        var percentage = (noise - _min) / (_max - _min);
        var rgb = percentage * 255;

        canvas.drawRect(
            Rect.fromLTWH(x * blockSize, y * blockSize, pixelSize, pixelSize),
            paint..color = color.withAlpha(rgb.floor()));
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
