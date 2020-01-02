import 'package:flutter/material.dart';
import 'package:hello_world/pages/my_expenses/widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

class MyExpenses extends StatefulWidget {
  MyExpenses({Key key}) : super(key: key);

  @override
  _MyExpensesState createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> with WidgetsBindingObserver {
  AppBar refAppBar;
  bool _showChart = false;
  bool _isLandscape = false;
  final List<Transaction> _userTransactions = [
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
    Transaction(
      id: '3',
      title: 'New shoes',
      amount: 100.50,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    _isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    refAppBar = AppBar(
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
    );

    return Scaffold(
      appBar: refAppBar,
      body: buildUI(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _showModalNewTransaction(context),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Widget buildUI(BuildContext context) {
    final txListWidget = Container(
      height: MediaQuery.of(context).size.height * .62 -
          refAppBar.preferredSize.height -
          MediaQuery.of(context).padding.top,
      child: TransactionList(
        _userTransactions,
        _deleteTransaction,
      ),
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (_isLandscape) ..._buildLandscapeContent(txListWidget),
          if (!_isLandscape) ..._buildPortraitContent(txListWidget),
        ],
      ),
    );
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  List<Widget> _buildLandscapeContent(txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show Dart'),
          Switch(
            value: _showChart,
            onChanged: (value) {
              setState(() {
                _showChart = value;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: MediaQuery.of(context).size.height * .7 -
                  refAppBar.preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Chart(
                _recentTransactions,
              ),
            )
          : txListWidget,
    ];
  }

  List<Widget> _buildPortraitContent(txListWidget) {
    return [
      Container(
        height: MediaQuery.of(context).size.height * .4 -
            refAppBar.preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: Chart(
          _recentTransactions,
        ),
      ),
      txListWidget
    ];
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
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

  void _addNewTransaction(
      String txtTitle, double inputAmount, DateTime selectedDate) {
    final newTransaction = Transaction(
      title: txtTitle,
      amount: inputAmount,
      date: selectedDate,
      id: selectedDate.toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _deleteTransaction(Transaction txt) {
    setState(() {
      _userTransactions.removeWhere((transac) => transac.id == txt.id);
    });
  }
}
