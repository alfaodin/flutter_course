import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world/pages/main_menu/data/onboard-page-dat.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: -100, end: 0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          print('Empezo');
        }
        if (status == AnimationStatus.completed) {
          print('Termino');
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mi aplicacion de pruebas'),
        ),
        body: Container(
          color: Colors.blueGrey,
          constraints: BoxConstraints.expand(),
          child: _buildDynamicGrid(context),
        ),
      ),
    );
  }

  Widget _buildDynamicGrid(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 20,
      ),
      itemBuilder: (BuildContext context, int position) {
        double startTime = position / 8;
        double endTime = position > 0 ? position / 6 : 0.25;

        print('Prueba: ${startTime} - $endTime');
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-200.0, 0),
            end: Offset(0.0, 0.0),
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(startTime, endTime, curve: Curves.linear),
            ),
          ),
          child: RaisedButton.icon(
            color: mainMenuListData[position].mainColor,
            icon: Icon(mainMenuListData[position].iconData),
            label: Text(
              mainMenuListData[position].label,
              style: TextStyle(color: mainMenuListData[position].textColor),
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context, mainMenuListData[position].navigationPath);
            },
          ),
        );
      },
      itemCount: mainMenuListData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
    );
  }

  Widget _buildStaggerdGrid(BuildContext context) {
    print('Esta es una prueba ${animation.value}');
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12,
      padding: EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 20,
      ),
      children: <Widget>[
        Transform.translate(
          offset: Offset(animation.value, 0),
          child: RaisedButton.icon(
            icon: Icon(Icons.all_inclusive),
            label: Text('Stagger Animation'),
            onPressed: () {
              Navigator.pushNamed(context, '/stagger');
            },
          ),
        ),
        RaisedButton.icon(
          icon: Icon(Icons.assignment),
          label: Text('Flutter Course'),
          onPressed: () {
            Navigator.pushNamed(context, '/course');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.music_note),
          label: Text('Music Player'),
          onPressed: () {
            Navigator.pushNamed(context, '/music');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.speaker_notes),
          label: Text('Splash'),
          onPressed: () {
            Navigator.pushNamed(context, '/splash');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add_to_home_screen),
          label: Text('Administrador'),
          onPressed: () {
            Navigator.pushNamed(context, '/admin');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.memory),
          label: Text('Manager'),
          onPressed: () {
            Navigator.pushNamed(context, '/manager');
          },
        ),
      ],
    );
  }

  Widget _buildNormalMenu(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Spacer(
          flex: 2,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.all_inclusive),
          label: Text('Stagger Animation'),
          onPressed: () {
            Navigator.pushNamed(context, '/stagger');
          },
        ),
        Spacer(
          flex: 2,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.assignment),
          label: Text('Flutter Course'),
          onPressed: () {
            Navigator.pushNamed(context, '/course');
          },
        ),
        Spacer(
          flex: 2,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.music_note),
          label: Text('Music Player'),
          onPressed: () {
            Navigator.pushNamed(context, '/music');
          },
        ),
        Spacer(
          flex: 2,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.speaker_notes),
          label: Text('Splash'),
          onPressed: () {
            Navigator.pushNamed(context, '/splash');
          },
        ),
        Spacer(
          flex: 2,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add_to_home_screen),
          label: Text('Administrador'),
          onPressed: () {
            Navigator.pushNamed(context, '/admin');
          },
        ),
        Spacer(
          flex: 2,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.memory),
          label: Text('Manager'),
          onPressed: () {
            Navigator.pushNamed(context, '/manager');
          },
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
