import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/pages/page-view/introduction.dart';
import 'package:hello_world/pages/page-view/providers/color_provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World2'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ColorProvider(),
        child: IntroducctionPage(),
      ),
    );
  }
}
