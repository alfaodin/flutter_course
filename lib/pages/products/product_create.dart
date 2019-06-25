import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function createProductCallback;

  const ProductCreate({Key key, this.createProductCallback}) : super(key: key);

  @override
  _ProductCreateState createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  String _titleValue = '';
  double _priceValue = 0.0;
  String _descriptionValue = '';

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * .95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Nombre del producto',
            ),
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
                maxLines: 4,
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
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Consultar Producto'),
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
                  RaisedButton(
                    child: Text('Crear Producto'),
                    textColor: Colors.pink,
                    onPressed: () {
                      final Map<String, dynamic> product = {
                        'title': _titleValue,
                        'description': _descriptionValue,
                        'price': _priceValue,
                        'image': 'assets/food.jpg',
                      };
                      widget.createProductCallback(product);
                      Navigator.pushReplacementNamed(context, '/manager');
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
