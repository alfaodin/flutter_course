import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hello_world/product_manager.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'test',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          cardColor: Color.fromARGB(140, 255, 0, 0),
        ),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text('Hello World'),
        //   ),
        //   body: ProductManager(['test']),
        // ),
        // HTTP TEST
        //home: PhotoList(),
        home: TextController());
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
    return Column(
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
    // TODO: implement build
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
