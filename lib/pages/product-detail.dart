import 'dart:async';

import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const ProductDetail(this.title, this.imageUrl, this.description);

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
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald',
                      color: Colors.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  description,
                ),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Delete'),
                onPressed: () => _showWarningDialog(context),
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

  _showWarningDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Estas seguro de borrar el producto'),
            content: Text('Esta accion no prodra deshacerse'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }
}
