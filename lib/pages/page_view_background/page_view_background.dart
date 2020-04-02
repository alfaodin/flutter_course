import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './styles.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _page = pageController.page;
      _offset = pageController.offset;
      notifyListeners();
    });
  }
  double get page => _page;
  double get offset => _offset;
}

class PageViewBackground extends StatefulWidget {
  PageViewBackground({Key key}) : super(key: key);

  @override
  _PageViewBackgroundState createState() => _PageViewBackgroundState();
}

class _PageViewBackgroundState extends State<PageViewBackground> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              BackgroundImage(),
              PageView(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  DefenseScreen(),
                  MidfieldScreen(),
                  AttackScreen(),
                ],
              ),
              SoccerBall(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        //EFECTO como avanzar horizontalmente al arco
        return Positioned(
          top: 100,
          width: MediaQuery.of(context).size.width * 3,
          left: -notifier.offset,
          child: Image.asset(
            'assets/futbol/FGZ_bg_estadio_estadisticas.jpg',
            fit: BoxFit.contain,
          ),
        );
        // EFECTO DE ZOO  como entrar en el arco
        // return Positioned(
        //   top: 100,
        //   child: Transform.scale(
        //     scale: 3,
        //     child: Image.asset(
        //       'assets/futbol/FGZ_bg_estadio_estadisticas.jpg',
        //       width: notifier.offset,
        //     ),
        //   ),
        // );
      },
    );
  }
}

class SoccerBall extends StatelessWidget {
  const SoccerBall({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double ballPosition =
            (MediaQuery.of(context).size.width * notifier.page.round()) +
                MediaQuery.of(context).size.width * .2;
        print(
            'offset ${notifier.offset} pagina ${notifier.page} width ${MediaQuery.of(context).size.width} y resultados $ballPosition');

        return Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width * .2,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.limeAccent,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          //duration: Duration(milliseconds: 300),
        );
      },
    );
  }
}

class DefenseScreen extends StatelessWidget {
  const DefenseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Defensa'),
    );
  }
}

class MidfieldScreen extends StatelessWidget {
  const MidfieldScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Center(
          child: Text(
            'Medio campo',
          ),
        ),
      ),
    );
  }
}

class AttackScreen extends StatelessWidget {
  const AttackScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Attack'),
    );
  }
}
