import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class MenuOption {
  final String label;
  final IconData iconData;

  MenuOption(this.label, this.iconData);
}

class RadialMenu extends StatefulWidget {
  const RadialMenu({Key key}) : super(key: key);

  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with TickerProviderStateMixin {
  final List<MenuOption> _options = [];
  AnimationController _controller;
  Animation<double> _animationAngle;

  @override
  void initState() {
    super.initState();

    _options.add(MenuOption('Menu 1', Icons.label));
    _options.add(MenuOption('Menu 2', Icons.label_important));
    _options.add(MenuOption('Menu 3', Icons.laptop_chromebook));
    _options.add(MenuOption('Menu 4', Icons.layers));
    _options.add(MenuOption('Menu 5', Icons.library_music));
    _options.add(MenuOption('Menu 6', Icons.link_off));
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 1500,
      ),
      
      vsync: this,
    );

    _animationAngle = Tween<double>(
      begin: -math.pi,
      end: 0,
    ).animate(_controller,);
    _animationAngle.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoratorWidth = size.width * .85;
    final containerOuterWidth = decoratorWidth + 100;

    final itemsCount = _options.length;
    final step = math.pi / itemsCount;

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
                    child: Transform.rotate(
                      angle: _animationAngle.value,
                      child: SvgPicture.asset(
                        'assets/radial_menu/decoration.svg',
                        width: decoratorWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -containerOuterWidth / 2,
                    child: Transform.rotate(
                      angle: _animationAngle.value,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
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
                          ...List.generate(itemsCount, (int index) {
                            final angle =
                                (math.pi / 2 + index * step) + step / 2;
                            return MenuItem(
                              menuOption: _options[index],
                              offset: Offset(
                                containerOuterWidth / 2 * math.cos(angle),
                                containerOuterWidth / 2 * math.sin(angle),
                              ),
                              textOffset: Offset(
                                -60,
                                10 - (30 * (index / itemsCount)),
                              ),
                            );
                          })
                        ],
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

class MenuItem extends StatelessWidget {
  final Offset offset;
  final Offset textOffset;
  final MenuOption menuOption;

  const MenuItem(
      {Key key,
      @required this.menuOption,
      @required this.offset,
      @required this.textOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            child: Container(
              width: 50,
              height: 50,
              child: Center(
                child: Icon(
                  menuOption.iconData,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
              ),
            ),
          ),
          Transform.translate(
            offset: textOffset,
            child: SizedBox(
              width: 100,
              child: Text(
                menuOption.label,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
