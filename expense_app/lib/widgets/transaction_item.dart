import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget{

  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final curScaleFactor = mediaQuery.textScaleFactor;
    final deviceWidth = mediaQuery.size.width;
    return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                            'PHP${transaction.amount.toStringAsFixed(2)}'),
                      )),
                ),
                title: Text(
                  '${transaction.title}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat().add_yMMMd().format(transaction.date),
                  style: TextStyle(fontSize: 10 * curScaleFactor),
                ),
                trailing: deviceWidth > 460
                    ? FlatButton.icon(
                        icon: Icon(Icons.delete),
                        textColor: Theme.of(context).errorColor,
                        label: Text('Delete'),
                        onPressed: () {
                          deleteTransaction(transaction.id);
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteTransaction(transaction.id);
                        },
                        color: Theme.of(context).errorColor,
                      ),
                )
            );
  }
}