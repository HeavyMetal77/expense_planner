import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.purple)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transactions[index].title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                // DateFormat('EEE, dd.MM.yyy').format(tx.date),
                                DateFormat.yMMMd()
                                    .format(transactions[index].date),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      ],
                    ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
