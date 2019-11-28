import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function onCreateFn;

  NewTransaction(this.onCreateFn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return inputExpenses();
  }

  Widget inputExpenses() {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Lugar de Gasto",
              ),
              controller: titleController,
              onSubmitted: (_) => onSaveNewTransaction(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Cantidad",
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => onSaveNewTransaction(),
            ),
            FlatButton(
              child: Text("Añadir gasto"),
              onPressed: onSaveNewTransaction,
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }

  void onSaveNewTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    this.widget.onCreateFn(enteredTitle, enteredAmount);
  }
}
