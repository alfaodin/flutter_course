import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function createProductCallback;

  const ProductCreate({Key key, this.createProductCallback}) : super(key: key);

  @override
  _ProductCreateState createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> _formData = {
      'title': null,
      'description': null,
      'price': null,
      'image': 'assets/food.jpg'
    };
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * .95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              TextFormField(
                autovalidate: true,
                validator: (String value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Title is Required an should be 5+ characters long.';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Nombre del producto',
                ),
                textAlign: TextAlign.center,
                onSaved: (String value) {
                  _formData['title'] = value;
                },
              ),
              Text(
                _formData['title'] ?? '',
                textAlign: TextAlign.left,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Descripcion:'),
                  ),
                  TextFormField(
                    maxLines: 4,
                    validator: (String value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Description is Required an should be 10+ characters long.';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: 'Ingresa descipcion del producto',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      _formData['description'] = value;
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
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty ||
                          !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$')
                              .hasMatch(value)) {
                        return 'Price is required and should be a number.';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: 'Ingresa el precio del producto',
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (String value) {
                      _formData['price'] =
                          double.parse(value.replaceFirst(RegExp(r','), '.'));
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
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            widget.createProductCallback(_formData);
                            Navigator.pushReplacementNamed(context, '/manager');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
