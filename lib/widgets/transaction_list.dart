import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

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
                // return Card(
                //     elevation: 5,
                //     child: Row(
                //       children: [
                //         Container(
                //           margin: EdgeInsets.symmetric(
                //               horizontal: 10, vertical: 15),
                //           decoration: BoxDecoration(
                //               border:
                //                   Border.all(width: 2, color: Colors.purple)),
                //           padding: EdgeInsets.all(10),
                //           child: Text(
                //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //                 color: Theme.of(context).primaryColor),
                //           ),
                //         ),
                //         Container(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 transactions[index].title,
                //                 style: Theme.of(context).textTheme.headline6,
                //               ),
                //               Text(
                //                 // DateFormat('EEE, dd.MM.yyy').format(tx.date),
                //                 DateFormat.yMMMd()
                //                     .format(transactions[index].date),
                //                 style: TextStyle(color: Colors.grey),
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ));
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      '${DateFormat.yMMMEd().format(transactions[index].date)}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: ()=>{_deleteTransaction(transactions[index].id)},
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
