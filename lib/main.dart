import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:hello_world/pages/home.dart';
import 'package:hello_world/pages/mapa/mapa.dart';
import 'package:hello_world/pages/meals/meals.dart';
import 'package:hello_world/pages/quiz_app/quiz.dart';
import 'package:hello_world/pages/domino/domino.dart';
import 'package:hello_world/pages/sqlLite/sqlLite.dart';
import 'package:hello_world/pages/main_menu/main_menu.dart';
import 'package:hello_world/pages/color_menu/color_menu.dart';
import 'package:hello_world/pages/custom_paint/flip_view.dart';
import 'package:hello_world/pages/start_field/star_field.dart';
import 'package:hello_world/pages/todo_sqflite/todo_crud.dart';
import 'package:hello_world/pages/my_expenses/my_expenses.dart';
import 'package:hello_world/pages/custom_path/custom_path.dart';
import 'package:hello_world/pages/radial_menu/radial_menu.dart';
import 'package:hello_world/pages/sidebar_menu/sidebar_menu.dart';
import 'package:hello_world/pages/curves_design/curve_design.dart';
import 'package:hello_world/pages/icon_animation/icon_animation.dart';
import 'package:hello_world/pages/stagger/stagger_animation_page.dart';
import 'package:hello_world/pages/complex_ui_animation/complex_ui.dart';
import 'package:hello_world/pages/page_view_background/page_view_background.dart';

import 'package:hello_world/pages/auth.dart';
import 'package:hello_world/product_manager.dart';
import 'package:hello_world/pages/product-detail.dart';
import 'package:hello_world/pages/music/music_home.dart';
import 'package:hello_world/pages/products/product_admin.dart';

main() {
  // PERMITE DIBUJAR EN PATALLA LOS BOXES DE CADA WIDGET
  // debugPaintSizeEnabled = true;

  //PERMITE LIMITAR LA ROTACION DE LA PANTALLA
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() => _products.add(product));
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Mis pruebas',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red.shade900,
        fontFamily: 'Oswald',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                ),
              ),
        ),
      ),
      //home: Home(),
      routes: {
        '/': (BuildContext context) => MainMenu(),
        '/course': (BuildContext context) => AuthPage(),
        '/manager': (BuildContext context) =>
            ProductManager(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) =>
            ProductAdmin(_addProduct, _products),
        '/music': (BuildContext context) => MusicHome(),
        '/splash': (BuildContext context) => Home(),
        '/stagger': (BuildContext context) => StaggerPageAnimator(),
        '/domino': (BuildContext context) => DominoAnimation(),
        '/mapa': (BuildContext context) => MyMap(),
        '/flip': (BuildContext context) => FlipView(),
        '/quiz': (BuildContext context) => QuizApp(),
        '/sqlLite': (BuildContext context) => SqlLiteScreen(),
        '/todo': (BuildContext context) => TodoCrud(),
        '/curves': (BuildContext context) => CurveDesign(),
        '/expenses': (BuildContext context) => MyExpenses(),
        '/radialMenu': (BuildContext context) => RadialMenu(),
        '/sidebarMenu': (BuildContext context) => SideBarMenu(),
        '/customPath': (BuildContext context) => CustomPath(),
        '/meals': (BuildContext context) => Meals(),
        '/iconAnimation': (BuildContext context) => IconAnimation(),
        '/starField': (BuildContext context) => StarField(),
        '/colorMenu': (BuildContext context) => ColorMenu(),
        '/pageViewBg': (BuildContext context) => PageViewBackground(),
        '/complexUI': (BuildContext context) => ComplexUI(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductDetail(
              _products[index]['title'],
              _products[index]['image'],
              _products[index]['price'],
              _products[index]['description'],
            ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return ProductManager(_products, _addProduct, _deleteProduct);
        });
      },
      // HTTP TEST
      //home: PhotoList(),
      // Exercise
      //home: TextController()
    );
  }
}

//************************ EXERCISE ****************************/
class TextController extends StatefulWidget {
  const TextController({Key key}) : super(key: key);

  @override
  _TextControllerState createState() => _TextControllerState();
}

class _TextControllerState extends State<TextController> {
  String changeText = '';

  @override
  void initState() {
    super.initState();
    changeText = ' Hello World';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: MyText(changeText)),
          Container(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColorLight,
                child: Text('Cambia texto'),
                onPressed: () => {
                  setState(() => {changeText = getNewString()}),
                },
              )),
        ],
      ),
    );
  }

  String getNewString() {
    Random rng = new Random();
    return rng.nextInt(100).toString() + 'QUE TAL';
  }
}

class MyText extends StatelessWidget {
  final String text;

  MyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

//************************ HTPP REQUEST ****************************/
class PhotoList extends StatefulWidget {
  @override
  PhotoListState createState() => PhotoListState();
}

class PhotoListState extends State<PhotoList> {
  StreamController<Photo> streamController;
  List<Photo> list = [];

  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();

    streamController.stream.listen((p) => setState(() => list.add(p)));

    load(streamController);
  }

  @override
  void dispose() {
    super.dispose();
    streamController?.close();
    streamController = null;
  }

  load(StreamController sc) async {
    String url = 'https://jsonplaceholder.typicode.com/photos';
    var client = new http.Client();
    var req = new http.Request('get', Uri.parse(url));

    var streamResp = await client.send(req);

    streamResp.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((e) => e)
        .map((map) => Photo.fromJsonMap(map))
        .pipe(streamController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stramed photos'),
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => _makeElement(index),
        ),
      ),
    );
  }

  Widget _makeElement(int index) {
    if (index >= list.length) {
      return null;
    }
    return Container(
      padding: EdgeInsets.all(5.0),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Column(
          children: <Widget>[
            Image.network(list[index].url),
            Text(list[index].title)
          ],
        ),
      ),
    );
  }
}

class Photo {
  final String title;
  final String url;

  Photo.fromJsonMap(Map map)
      : title = map['title'],
        url = map['url'];
}
