import 'dart:async';

import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ProductDetail(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detalle de $title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(title),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Delete'),
                onPressed: () => Navigator.pop(context, true),
              )
            ],
          ),
        ),
      ),
      onWillPop: () {
        print('BACK PRESSED');
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}
