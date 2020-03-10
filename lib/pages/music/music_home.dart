import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:hello_world/pages/music/songs.dart';
import 'package:hello_world/theme/music_theme.dart';
import 'package:hello_world/pages/music/songs_controls.dart';

import 'package:fluttery_dart2/animations.dart';
import 'package:fluttery_dart2/gestures.dart';

class MusicHome extends StatefulWidget {
  @override
  _MusicHomeState createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // Audio(
    //   audioUrl: demoPlaylist.songs[0].audioUrl,
    //   playbackState: PlaybackState.paused,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.transparent,
    //       elevation: 0.0,
    //       title: Text(''),
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back_ios),
    //         onPressed: () {},
    //         color: const Color(0xFFDDDDDD),
    //       ),
    //       actions: <Widget>[
    //         IconButton(
    //           icon: Icon(Icons.menu),
    //           onPressed: () {},
    //           color: const Color(0xFFDDDDDD),
    //         ),
    //       ],
    //     ),
    //     body: Column(
    //       children: <Widget>[
    //         // SEEK BAR
    //         Expanded(
    //           child: new RadialSeekBar(),
    //         ),
    //         // VISUALIZER
    //         Container(
    //           width: double.infinity,
    //           height: 125,
    //         ),
    //         //SONG INFO
    //         new SongsControls(),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class RadialSeekBar extends StatefulWidget {
  final double seekPercent;

  RadialSeekBar({
    this.seekPercent = 0.0,
  });

  @override
  _RadialSeekBarState createState() => _RadialSeekBarState();
}

class _RadialSeekBarState extends State<RadialSeekBar> {
  double _seekPercent = 0;
  double _startDragPercent;
  double _currentDragPercent;
  PolarCoord _startDragCoord;

  void _onDragStart(PolarCoord coord) {
    _startDragCoord = coord;
    _startDragPercent = _seekPercent;
  }

  void _onDragUpdate(PolarCoord coord) {
    final double dragAngle = coord.angle - _startDragCoord.angle;
    final dragPercent = dragAngle / (2 * pi);
    setState(() => _currentDragPercent = (_startDragPercent - dragPercent) % 1);
  }

  void _onDragEnd() {
    setState(() {
      _seekPercent = _currentDragPercent;
      _currentDragPercent = null;
      _startDragCoord = null;
      _startDragPercent = 0.0;
    });
  }

  _RadialSeekBarState({
    @required double currentDragPercent,
    @required double seekPercent,
  })  : _currentDragPercent = currentDragPercent,
        _seekPercent = seekPercent;

  @override
  void initState() {
    super.initState();
    _seekPercent = widget.seekPercent;
  }

  @override
  void didUpdateWidget(RadialSeekBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _seekPercent = widget.seekPercent;
  }

  @override
  Widget build(BuildContext context) {
    return RadialDragGestureDetector(
      onRadialDragStart: _onDragStart,
      onRadialDragUpdate: _onDragUpdate,
      onRadialDragEnd: _onDragEnd,
      child: Container(
        color: Colors.indigo,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            width: 140,
            height: 140,
            child: RadialProgressBar(
              trackColor: const Color(0xFFDDDDDD),
              progressPercent: _currentDragPercent ?? _seekPercent,
              progressColor: accentColor,
              thumbPosition: _currentDragPercent ?? _seekPercent,
              thumbColor: lightAccentColor,
              innerPadding: const EdgeInsets.all(10),
              outerPadding: const EdgeInsets.all(10),
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

class RadialProgressBar extends StatefulWidget {
  final Color thumbColor;
  final double thumbSize;

  final Color trackColor;
  final double trackWidth;

  final Color progressColor;
  final double progressWidth;

  final double thumbPosition;
  final double progressPercent;

  final EdgeInsets innerPadding;
  final EdgeInsets outerPadding;

  final Widget child;

  RadialProgressBar({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
    this.progressWidth = 5.0,
    this.progressColor = Colors.black,
    this.thumbSize = 10.0,
    this.thumbColor = Colors.black,
    this.progressPercent = 0,
    this.thumbPosition = 0,
    this.innerPadding = const EdgeInsets.all(0.0),
    this.outerPadding = const EdgeInsets.all(0.0),
    this.child,
  });

  _RadialProgressBarState createState() => _RadialProgressBarState();
}

class _RadialProgressBarState extends State<RadialProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.outerPadding,
      child: CustomPaint(
        foregroundPainter: RadialSeekBarPainter(
          trackWidth: widget.trackWidth,
          trackColor: widget.trackColor,
          progressWidth: widget.progressWidth,
          progressColor: widget.progressColor,
          progressPercent: widget.progressPercent,
          thumbSize: widget.thumbSize,
          thumbColor: widget.thumbColor,
          thumbPosition: widget.thumbPosition,
        ),
        child: Padding(
          padding: _insetsForPainter() + widget.innerPadding,
          child: widget.child,
        ),
      ),
    );
  }

  EdgeInsets _insetsForPainter() {
    final outerThickness =
        max(widget.trackWidth, max(widget.progressWidth, widget.thumbSize)) /
            2.0;
    return new EdgeInsets.all(outerThickness);
  }
}

class RadialSeekBarPainter extends CustomPainter {
  final Color thumbColor;
  final double thumbSize;

  Paint trackPaint;
  final Color trackColor;
  final double trackWidth;

  Paint progressPaint;
  final Color progressColor;
  final double progressWidth;

  Paint thumbPaint;
  final double thumbPosition;
  final double progressPercent;

  RadialSeekBarPainter({
    @required this.trackWidth,
    @required this.trackColor,
    @required this.progressWidth,
    @required this.progressColor,
    @required this.thumbSize,
    @required this.thumbColor,
    @required this.progressPercent,
    @required this.thumbPosition,
  })  : trackPaint = new Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = trackWidth,
        progressPaint = new Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = progressWidth
          ..strokeCap = StrokeCap.round,
        thumbPaint = new Paint()
          ..color = thumbColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    print(size);

    final outerThickness = max(trackWidth, max(progressWidth, thumbSize));
    Size constrainedSize = new Size(
      size.width - outerThickness,
      size.height - outerThickness,
    );

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(constrainedSize.width, constrainedSize.height) / 2;

    // Paint the track
    canvas.drawCircle(center, radius, trackPaint);

    final Rect rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final progressAngle = 2 * pi * progressPercent;
    // Paint progress
    canvas.drawArc(rect, -pi / 2, progressAngle, false, progressPaint);

    // Paint Thumnb
    final thumbAngle = 2 * pi * thumbPosition - (pi / 2);
    final thumbX = cos(thumbAngle) * radius;
    final thumbY = sin(thumbAngle) * radius;
    final thumbCenter = Offset(thumbX, thumbY) + center;
    final thumbRadius = thumbSize / 2;
    canvas.drawCircle(thumbCenter, thumbRadius, thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
