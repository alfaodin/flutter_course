import 'dart:async';

import 'package:flutter/widgets.dart';

class DelayedReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;

  DelayedReveal({Key key, @required this.child, @required this.delay})
      : super(key: key);

  _DelayedRevealState createState() => _DelayedRevealState();
}

class _DelayedRevealState extends State<DelayedReveal>
    with SingleTickerProviderStateMixin {
  Timer _timer;
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInQuad,
    );

    _timer = Timer(widget.delay, _controller.forward);

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0.0, (1.0 - _animation.value) * 20.0),
            child: child,
          ),
        );
      },
    );
  }
}
