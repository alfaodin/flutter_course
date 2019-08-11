import 'dart:ui';
import 'package:flutter/widgets.dart';

class MainMenuModel {
  final Color mainColor;
  final Color textColor;

  final String label;
  final String navigationPath;
  final IconData iconData;

  MainMenuModel(this.mainColor, this.textColor, this.label, this.navigationPath,
      this.iconData);
}
