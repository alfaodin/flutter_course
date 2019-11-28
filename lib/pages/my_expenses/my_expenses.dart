import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

class MyExpenses extends StatefulWidget {
  MyExpenses({Key key}) : super(key: key);

  @override
  _MyExpensesState createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1',
    //   title: 'New shoes',
    //   amount: 70.50,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   title: 'Supermaxi',
    //   amount: 80.78,
    //   date: DateTime.now(),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Gastos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              _showModalNewTransaction(context);
            },
          )
        ],
      ),
      body: buildUI(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _showModalNewTransaction(context),
      ),
    );
  }

  Widget buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //CHART
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
          //LISTADO DE GASTOS
          TransactionList(_userTransactions)
        ],
      ),
    );
  }

  void _showModalNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _addNewTransaction(String txtTitle, double inputAmount) {
    final newTransaction = Transaction(
      title: txtTitle,
      amount: inputAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }
}
