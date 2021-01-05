import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTrancactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTrancactionValue.fold(0.0,
        (previousValueSum, element) => previousValueSum + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTrancactionValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['Day'],
                spendingAmount: data['amount'],
                spendingPercentageOfTotal: totalSpending == 0.0
                    ? 0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
