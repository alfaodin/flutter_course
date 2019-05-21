import 'package:flutter/material.dart';
import 'package:hello_world/pages/page-view/drawer-paint.dart';
import 'package:hello_world/pages/page-view/model/onboard-page-model.dart';

class OnboardPageState extends StatefulWidget {
  final OnboardPageModel pageModel;
  const OnboardPageState({Key key, this.pageModel}) : super(key: key);
  @override
  _OnboardPageStateState createState() => _OnboardPageStateState();
}

class _OnboardPageStateState extends State<OnboardPageState> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: widget.pageModel.primeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Image.asset(widget.pageModel.imagePath),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.pageModel.caption,
                          style: TextStyle(
                              fontSize: 24,
                              color:
                                  widget.pageModel.accentColor.withOpacity(.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.pageModel.subhead,
                          style: TextStyle(
                              fontSize: 32,
                              color: widget.pageModel.accentColor,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.pageModel.description,
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  widget.pageModel.accentColor.withOpacity(.8),
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomPaint(
            painter: DrawerPaint(curveColor: widget.pageModel.accentColor),
            child: Container(
              width: 50,
              height: double.infinity,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: widget.pageModel.primeColor,
                    iconSize: 32,
                    onPressed: _nexButtonPressed,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _nexButtonPressed() {
    print('esta es una prueba');
  }
}
