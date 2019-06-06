import 'package:flutter/material.dart';

class ProductCreate extends StatelessWidget {
  const ProductCreate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          child: Text('Create Product'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Text('This is a Modal'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
