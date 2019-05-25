import 'package:flutter/material.dart';
import 'package:hello_world/pages/page-view/providers/color_provider.dart';
import '../product_manager.dart';
import 'package:hello_world/pages/page-view/introduction.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello World2'),
        ),
        // body: ProductManager(),
        body: ChangeNotifierProvider(
            builder: (context) => ColorProvider(), child: IntroducctionPage()));
  }
}
