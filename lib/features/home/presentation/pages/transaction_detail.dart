import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/features/home/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetail extends StatelessWidget {
  static const route = '/transaction_detail';

  final TransactionModel _transaction;

  const TransactionDetail(this._transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expense = _transaction.type == TransactionType.expense;

    return Scaffold(
        appBar: AppBar(title: const Text('Transacción')),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(_transaction.description, style: theme.textTheme.displaySmall),
            Text('${expense ? '-' : '+'} ${_transaction.value}',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 28.0,
                )),
            const Divider(height: 25.0),
            _info('Categoría', _transaction.category),
            const Divider(),
            _info('Fecha', DateFormat('dd/MM/yyyy').format(_transaction.date)),
            const Divider(),
            _info('Hora', DateFormat('hh:mm a').format(_transaction.date))
          ]),
        )));
  }

  Widget _info(String title, String subtitle) {
    return ListTile(
        title: Text(title,
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700])),
        subtitle: Text(subtitle,
            style: TextStyle(fontSize: 20.0, color: Colors.grey[800])));
  }
}
