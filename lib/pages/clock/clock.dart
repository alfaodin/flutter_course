import 'package:flutter/material.dart';

import 'clock_view.dart';

class ClockScren extends StatelessWidget {
  const ClockScren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF2D2F41),
        child: ClockView(),
      ),
    );
  }
}
