import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  GlobalKey<AnimatedListState> animatedListKey =
      new GlobalKey<AnimatedListState>();

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return expensesWidget(context);
  }

  Widget expensesWidget(BuildContext context) {
    return Container(
      child: userTransactions.isEmpty
          ? buildNoTransactionImage(context)
          : buildTransactionList(),
    );
  }

  Widget buildNoTransactionImage(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
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
              height: constrains.maxHeight * .6,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildTransactionList() {
    return AnimatedList(
      key: animatedListKey,
      initialItemCount: userTransactions.length,
      itemBuilder: (BuildContext context, int index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: buildTransactionItem(index, context),
        );
      },
    );
  }

  Widget buildTransactionItem(int index, BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          userTransactions[index].title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          //  new DateFormat.yMd()             -> 7/10/1996
          //  new DateFormat("yMd")            -> 7/10/1996
          //  new DateFormat.yMMMMd("en_US")   -> July 10, 1996
          //  new DateFormat.jm()              -> 5:08 PM
          //  new DateFormat.yMd().add_jm()    -> 7/10/1996 5:08 PM
          //  new DateFormat.Hm()              -> 17:08
          DateFormat('yyyy-MM-dd').format(userTransactions[index].date),
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
                        deleteTransaction(userTransactions[index]);
                        print('DElete transaction');
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      tooltip: 'Borrar gasto',
                      onPressed: () {
                        deleteTransaction(userTransactions[index]);
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
