import 'package:flutter/material.dart';
import 'package:hello_world/pages/page-view/providers/color_provider.dart';
import 'package:hello_world/pages/page-view/splash.dart';
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
      // body: Container(
      //   padding: const EdgeInsets.all(20),
      //   child: Center(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: <Widget>[
      //         Spash(
      //           child: Container(
      //             width: 200,
      //             height: 150,
      //             color: Colors.blue,
      //             child: Center(
      //               child: Text('Square DATA'),
      //             ),
      //           ),
      //           onTap: () => print('TEST2222'),
      //         ),
      //         Spash(
      //           child: Text('Click Meeee'),
      //           onTap: () {
      //             print('TESDTTT');
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: ProductManager(),
    );
    // body: ChangeNotifierProvider(
    //   builder: (context) => ColorProvider(),
    //   child: IntroducctionPage(),
    // ));
  }
}
