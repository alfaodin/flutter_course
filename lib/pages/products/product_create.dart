import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  const ProductCreate({Key key}) : super(key: key);

  @override
  _ProductCreateState createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  String _titleValue = '';
  double _priceValue = 0.0;
  String _descriptionValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          Text(
            _titleValue,
            textAlign: TextAlign.left,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Descripcion:'),
              ),
              TextField(
                decoration: new InputDecoration(
                  labelText: 'Ingresa descipcion del producto',
                ),
                keyboardType: TextInputType.text,
                onChanged: (String value) {
                  setState(() {
                    _descriptionValue = value;
                  });
                },
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Valor:'),
              ),
              TextField(
                maxLines: 4,
                decoration: new InputDecoration(
                  labelText: 'Ingresa el precio del producto',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    _priceValue = double.parse(value);
                  });
                },
              )
            ],
          ),
          Center(
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
          ),
        ],
      ),
    );
  }
}
