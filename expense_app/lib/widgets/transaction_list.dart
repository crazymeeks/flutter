import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './no_transactiion.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    
    return transactions.isEmpty
        ? NoTransaction()
        : ListView.builder(
            itemBuilder: (ctx, index) {
              // Note: key is not currently working with ListView.builder
              return TransactionItem(key: ValueKey(transactions[index].id), transaction: transactions[index], deleteTransaction:_deleteTransaction);
              
              /*return Card(child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor)),
                      child: Text(
                        '\PHP${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                        ),
                        
                      ),
                      padding: EdgeInsets.all(10),
                      
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ],
                ),
              );*/
            },
            itemCount: transactions.length,
          );
  }
}
