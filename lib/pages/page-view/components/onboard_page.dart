import 'package:flutter/material.dart';

class OnboardPageState extends StatefulWidget {
  @override
  _OnboardPageStateState createState() => _OnboardPageStateState();
}

class _OnboardPageStateState extends State<OnboardPageState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Image.asset('assets/screen1.png'),
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
                      'Demo Caption',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Title of Screen',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'A good long description',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.8),
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
    );
  }
}
