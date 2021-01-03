import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'TV', amount: 1000.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Car', amount: 20000.99, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Ball', amount: 50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(children: transactions.map((tx) => Card(child: Text(tx.title),)).toList(),),
        ],
      ),
    );
  }
}
