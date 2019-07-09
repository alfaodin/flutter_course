import 'package:flutter/material.dart';
import 'package:hello_world/pages/stagger/home_page.dart';

class StaggerPageAnimator extends StatefulWidget {
  StaggerPageAnimator({Key key}) : super(key: key);

  _StaggerPageAnimatorState createState() => _StaggerPageAnimatorState();
}

class _StaggerPageAnimatorState extends State<StaggerPageAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;

  @override
  void iniState() {
    super.initState();
    _animController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      controller: _animController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }
}
