import 'package:flutter/material.dart';
import 'package:hello_world/theme/music_theme.dart';

class SongsControls extends StatelessWidget {
  const SongsControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Material(
        shadowColor: Color(0x44000000),
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
                    new PreviousButton(),
                    new PlayButton(),
                    new NextButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      icon: Icon(
        Icons.skip_previous,
        color: Colors.white,
        size: 35,
      ),
      onPressed: () {
        // TODO:
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
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
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      icon: Icon(
        Icons.skip_next,
        color: Colors.white,
        size: 35,
      ),
      onPressed: () {
        // TODO:
      },
    );
  }
}
