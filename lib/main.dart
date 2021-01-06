import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        // fontFamily: 'QuickSand',
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'QuickSand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double getSizeList() {
    return MediaQuery.of(context).size.height * 0.6;
  }

  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'TV', amount: 10.99, date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'Car',
        amount: 20.99,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 't4',
        title: 'Ball',
        amount: 5.01,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 't5',
        title: 'Notebook',
        amount: 120.01,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't6',
        title: 'Notebook2',
        amount: 120.01,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't7',
        title: 'Notebook3',
        amount: 120.01,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't8',
        title: 'Notebook4',
        amount: 120.01,
        date: DateTime.now().subtract(Duration(days: 4))),
  ];

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final Transaction tx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(tx);
    });
  }

  void _startAddNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (buildCntxt) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            // behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Personal Expenses',
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () => _startAddNewTransaction(context))
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}
