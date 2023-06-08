import 'package:proj/extensions/extensions.dart';
import 'package:proj/models/models.dart';
import 'package:proj/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final Transaction _transaction;
  const DetailsPage({required Key key, required Transaction transaction})
      : _transaction = transaction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 54.0),
          child: Column(
            children: [
              DetailsRow(
                title: 'Title:',
                content: _transaction.title,
                key: UniqueKey(),
              ),
              DetailsRow(
                title: 'Amount:',
                content:
                    '${getCurrencySymbol()} ${_transaction.amount.toStringAsFixed(2)}',
                key: UniqueKey(),
              ),
              DetailsRow(
                title: 'Date:',
                content: '${DateFormat.yMMMMEEEEd().format(_transaction.date)}',
                key: UniqueKey(),
              ),
              DetailsRow(
                title: 'Added:',
                content:
                    '${DateFormat.yMMMEd().format(_transaction.createdOn)} ${DateFormat.jm().format(_transaction.createdOn)}',
                key: UniqueKey(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final editedTransaction = await showModalBottomSheet(
            context: context,
            builder: (_) => NewTransaction.edit(
              transaction: _transaction,
              key: UniqueKey(),
            ),
            isScrollControlled: true,
          );
          if (editedTransaction != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  transaction: editedTransaction as Transaction,
                  key: UniqueKey(),
                ),
              ),
            );
          }
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String title;
  final String content;

  const DetailsRow({
    required Key key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.only(right: 8.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
