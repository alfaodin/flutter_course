import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/pages/music/songs.dart';
import 'package:hello_world/pages/music/songs_controls.dart';
import 'package:hello_world/theme/music_theme.dart';

class MusicHome extends StatelessWidget {
  const MusicHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
          color: const Color(0xFFDDDDDD),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: const Color(0xFFDDDDDD),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // SEEK BAR
          Expanded(
            child: Center(
              child: Container(
                width: 125,
                height: 125,
                child: RadialSeekBar(
                  child: ClipOval(
                    clipper: CircleClipper(),
                    child: Image.network(
                      demoPlaylist.songs[0].albumArtUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // VISUALIZER
          Container(
            width: double.infinity,
            height: 125,
          ),
          //SONG INFO
          new SongsControls(),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class RadialSeekBar extends StatefulWidget {
  final Color thumbColor;
  final double thumbSize;

  final Color trackColor;
  final double trackWidth;

  final Color progressColor;
  final double progressWidth;

  final double thumbPosition;
  final double progressPercentage;

  final Widget child;

  RadialSeekBar({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
    this.progressWidth = 5.0,
    this.progressColor = Colors.black,
    this.thumbSize = 10.0,
    this.thumbColor = Colors.black,
    this.progressPercentage = 0,
    this.thumbPosition = 0,
    this.child,
  });

  _RadialSeekBarState createState() => _RadialSeekBarState();
}

class _RadialSeekBarState extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialSeekBarPainter(),
      child: widget.child,
    );
  }
}

class RadialSeekBarPainter extends CustomPainter {
  final Color thumbColor;
  final double thumbSize;

  final Color trackColor;
  final double trackWidth;

  final Color progressColor;
  final double progressWidth;

  final double thumbPosition;
  final double progressPercentage;

  RadialSeekBarPainter({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
    this.progressWidth = 5.0,
    this.progressColor = Colors.black,
    this.thumbSize = 10.0,
    this.thumbColor = Colors.black,
    this.progressPercentage = 0,
    this.thumbPosition = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
