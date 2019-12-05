import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RadialMenu extends StatelessWidget {
  const RadialMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoratorWidth = size.width * .85;
    final containerOuterWidth = decoratorWidth + 100;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(children: <Widget>[
            ToolBar(),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    right: -decoratorWidth / 2,
                    child: SvgPicture.asset(
                      'assets/radial_menu/decoration.svg',
                      width: decoratorWidth,
                    ),
                  ),
                  Positioned(
                    right: -containerOuterWidth / 2,
                    child: Container(
                      width: containerOuterWidth,
                      height: containerOuterWidth,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.black26,
            )
          ]),
        ),
      ),
    );
  }
}

class ToolBar extends StatelessWidget {
  const ToolBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Whta does your soun \n need today?',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            child: Container(
              width: 50,
              height: 50,
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xfff0f0f0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(-5.0, 0),
                    ),
                  ],
                  border: Border.all(
                    width: 2,
                    color: Colors.redAccent,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
