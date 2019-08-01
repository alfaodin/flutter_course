import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key key}) : super(key: key);

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
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
