import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/theme/music_theme.dart';

class MusicHome extends StatelessWidget {
  const MusicHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
          color: const Color(0xFFDDDDDD),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: const Color(0xFFDDDDDD),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // SEEK BAR
          Expanded(
            child: Center(
              child: Container(
                width: 125,
                height: 125,
                child: Image.network(src),
              ),
            ),
          ),
          // VISUALIZER
          Container(
            width: double.infinity,
            height: 125,
          ),
          //SONG INFO
          Container(
            color: accentColor,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 50,
              ),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '',
                      children: [
                        // SONG TILTE
                        TextSpan(
                          text: 'Song Title \n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Artist Name',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.75),
                            fontSize: 12.0,
                            letterSpacing: 3,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Controls Play Pause Rewaind Forward
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            // TODO:
                          },
                        ),
                        RawMaterialButton(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.play_arrow,
                              color: darkAccentColor,
                              size: 35,
                            ),
                          ),
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          splashColor: lightAccentColor,
                          highlightColor: lightAccentColor.withOpacity(.5),
                          elevation: 10,
                          highlightElevation: 5,
                          onPressed: () {
                            // TODO:
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            // TODO:
                          },
                        ),
                      ],
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
