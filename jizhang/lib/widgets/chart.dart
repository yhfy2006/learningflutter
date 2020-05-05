import 'package:flutter/material.dart';
import 'package:jizhang/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:jizhang/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  // const Chart({Key key}) : super(key: key);
  final List<Transaction> recentTransactions;

  List<Map<String, Object>>  get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (Transaction trans in recentTransactions ) {
        if(trans.date.day == weekDay.day && trans.date.month == weekDay.month && trans.date.year == weekDay.year) {
          totalSum += trans.amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
        return sum += item['amount'];
    });
  }

  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            final totoalSpending = maxSpending;
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'], data['amount'], totoalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totoalSpending));
          }).toList() ,
        ),
      ),
    );
  }
}