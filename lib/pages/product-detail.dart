import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ProductDetail(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(title),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Back'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
