import 'package:flutter/material.dart';
import 'package:hello_world/pages/page-view/data/onboard-page-dat.dart';

class ColorProvider with ChangeNotifier {
  Color _color = onboardData[0].accentColor;

  Color get color => _color;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}
