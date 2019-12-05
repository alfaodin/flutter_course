import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onCreateFn;

  NewTransaction(this.onCreateFn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime _selectedDate;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
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
              controller: _titleController,
              onSubmitted: (_) => _onSaveNewTransaction(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Cantidad",
              ),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSaveNewTransaction(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      _presentDatePicker();
                    },
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text("Añadir gasto"),
              onPressed: _onSaveNewTransaction,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }

  void _presentDatePicker() {
    Future<DateTime> selectedTime = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );

    selectedTime.then((time) {
      if (time == null) {
        return;
      }
      setState(() {
        _selectedDate = time;
      });
    });
  }

  void _onSaveNewTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }
    
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    this.widget.onCreateFn(enteredTitle, enteredAmount, _selectedDate);
  }
}
