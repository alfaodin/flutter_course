import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page_enter_animation.dart';

class HomePage extends StatefulWidget {
  final HomePageEnterAnimation animation;

  HomePage({
    @required AnimationController controller,
  }) : animation = HomePageEnterAnimation(controller);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: widget.animation.controller,
          builder: (context, child) => _buildAnimation(context, child, size),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.animation.controller.reset();
            widget.animation.controller.forward();
          },
          tooltip: 'Increment Counter',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child, Size size) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  topBar(widget.animation.barHeight.value),
                  circle(
                    size,
                    widget.animation.avatarSize.value,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Opacity(
                    opacity: widget.animation.titleOpacity.value,
                    child: placeholderBox(60, 100, Alignment.centerLeft),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Opacity(
                      opacity: widget.animation.textOpacity.value,
                      child: placeholderBox(200, 100, Alignment.centerRight))
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 30,
          bottom: 60,
          child: GestureDetector(
            onPanUpdate: (details) {
              print('Veamos');
              setState(() => _offset += details.delta);
            },
            onDoubleTap: () => setState(() => _offset = Offset.zero),
            child: Container(
              width: 100,
              height: 180,
              color: Colors.blueAccent,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateX(0.05 * _offset.dy)
                  ..rotateY(-0.05 * _offset.dx),
                alignment: FractionalOffset.center,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.cyan,
                        child: Text(
                          '1',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue,
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 100,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1.0,
        ),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue.shade700),
        ),
      ),
    );
  }

  Align placeholderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green.shade300,
        ),
      ),
    );
  }
}
