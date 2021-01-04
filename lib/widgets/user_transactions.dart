import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'TV', amount: 10.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Car', amount: 20.99, date: DateTime.now()),
    Transaction(id: 't4', title: 'Ball', amount: 50.01, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final Transaction tx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [NewTransaction(_addNewTransaction), TransactionList(_userTransactions)],
    );
  }
}
