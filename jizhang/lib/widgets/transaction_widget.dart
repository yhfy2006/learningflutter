import 'package:flutter/material.dart';
import 'package:jizhang/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // name({Key key}) : super(key: key);
  final List<Transaction> userTransactios;
  final Function deleteTx;

  TransactionList(this.userTransactios, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransactios.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transactions added yet!',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                              child:
                                  Text('\$${userTransactios[index].amount}')),
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactios[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(userTransactios[index].date)),
                    trailing: MediaQuery.of(context).size.width > 360 ? FlatButton.icon(onPressed: null, icon: Icon(Icons.delete), label: Text('delete'), color: Theme.of(context).errorColor,):
                    IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => deleteTx((userTransactios[index].id),)),
                  ),
                );
              },
              itemCount: userTransactios.length,
            ),
    );
  }
}
