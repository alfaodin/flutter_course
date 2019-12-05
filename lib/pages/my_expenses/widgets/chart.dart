import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/pages/my_expenses/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map((data) {
            return buildChartBar(context, data);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildChartBar(BuildContext context, Map<String, Object> data) {
    double percentage = 0.0;
    if (data['amount'] != null && totalExpense > 0) {
      percentage = (data['amount'] as double) / totalExpense;
    }
    return Flexible(
      fit: FlexFit.tight,
      child: CharBar(
        label: data['day'],
        expense: data['amount'],
        expensePercentage: percentage,
      ),
    );
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalExpensesDay = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        var transaction = recentTransactions[i];
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalExpensesDay += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalExpensesDay
      };
    }).reversed.toList();
  }

  double get totalExpense {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }
}
