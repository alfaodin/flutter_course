import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/my_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function onDeleteCallback;

  TransactionItem({
    Key key,
    @required this.transaction,
    @required this.onDeleteCallback,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    super.initState();

    const myColors = [Colors.red, Colors.black, Colors.blue, Colors.purple];
    _bgColor = myColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _bgColor,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          //  new DateFormat.yMd()             -> 7/10/1996
          //  new DateFormat("yMd")            -> 7/10/1996
          //  new DateFormat.yMMMMd("en_US")   -> July 10, 1996
          //  new DateFormat.jm()              -> 5:08 PM
          //  new DateFormat.yMd().add_jm()    -> 7/10/1996 5:08 PM
          //  new DateFormat.Hm()              -> 17:08
          DateFormat('yyyy-MM-dd').format(widget.transaction.date),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: FittedBox(
          child: Row(
            children: <Widget>[
              MediaQuery.of(context).size.width > 300
                  ? FlatButton.icon(
                      color: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                      label: Text('Borrar'),
                      onPressed: () {
                        widget.onDeleteCallback(widget.transaction);
                        print('DElete transaction');
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      tooltip: 'Borrar gasto',
                      onPressed: () {
                        widget.onDeleteCallback(widget.transaction);
                        print('DElete transaction');
                      },
                    ),
              IconButton(
                icon: Icon(Icons.edit),
                tooltip: 'Editar gasto',
                onPressed: () {
                  print('Editar transaction');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
