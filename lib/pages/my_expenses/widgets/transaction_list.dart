import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return expensesWidget(context);
  }

  Widget expensesWidget(BuildContext context) {
    return Container(
      height: 340,
      child: userTransactions.isEmpty
          ? buildNoTransactionImage(context)
          : buildTransactionList(),
    );
  }

  Widget buildNoTransactionImage(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'There are no transations',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget buildTransactionList() {
    return ListView.builder(
      itemCount: userTransactions.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(
                  10,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    //  new DateFormat.yMd()             -> 7/10/1996
                    //  new DateFormat("yMd")            -> 7/10/1996
                    //  new DateFormat.yMMMMd("en_US")   -> July 10, 1996
                    //  new DateFormat.jm()              -> 5:08 PM
                    //  new DateFormat.yMd().add_jm()    -> 7/10/1996 5:08 PM
                    //  new DateFormat.Hm()              -> 17:08
                    DateFormat('yyyy-MM-dd')
                        .format(userTransactions[index].date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
