import 'package:flutter/material.dart';
import './models/transaction.dart';

class MyExpenses extends StatefulWidget {
  MyExpenses({Key key}) : super(key: key);

  @override
  _MyExpensesState createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New shoes',
      amount: 70.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Supermaxi',
      amount: 80.78,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('Mis Gastos'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.6),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black38,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              width: double.infinity,
              child: Card(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'chart',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                elevation: 5,
              ),
            ),
          ),
          chartWidget(),
        ],
      ),
    );
  }

  Widget chartWidget() {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  tx.amount.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(
                  10,
                ),
              ),
              Column(
                children: <Widget>[
                  Text(tx.title),
                  Text(tx.date.toString()),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
