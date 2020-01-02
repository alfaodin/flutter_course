import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/my_expenses/widgets/transaction_item.dart';
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
          : buildTransactionList(), //buildAnimatedTransactionList
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
    return ListView(
      children: userTransactions.map((tx) => buildTransactionItem(tx)).toList(),
    );
  }

  Widget buildAnimatedTransactionList() {
    return AnimatedList(
      key: animatedListKey,
      initialItemCount: userTransactions.length,
      itemBuilder: (BuildContext context, int index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: buildTransactionItem(userTransactions[index]),
        );
      },
    );
  }

  Widget buildTransactionItem(Transaction tx) {
    return TransactionItem(
      key: ValueKey(tx.id),
      transaction: tx,
      onDeleteCallback: deleteTransaction,
    );
  }
}
