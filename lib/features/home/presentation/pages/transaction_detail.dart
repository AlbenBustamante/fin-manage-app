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
    final expense = _transaction.type == TransactionType.expense;

    return Scaffold(
        appBar: AppBar(title: const Text('Detalle de Transacción')),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(_transaction.description,
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500)),
            Text('${expense ? '-' : '+'} ${_transaction.value}',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 28.0,
                )),
            Divider(height: 50.0, color: Colors.grey[700], thickness: 0.5),
            _info('Categoría', _transaction.category),
            Divider(color: Colors.grey[700], thickness: 0.5),
            _info('Fecha', DateFormat('dd/MM/yyyy').format(_transaction.date)),
            Divider(color: Colors.grey[700], thickness: 0.5),
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
            style: TextStyle(fontSize: 20.0, color: Colors.grey[900])));
  }
}
