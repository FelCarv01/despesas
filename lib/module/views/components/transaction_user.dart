import 'dart:math';

import 'package:despesas/module/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:despesas/module/views/components/transaction_form.dart';
import 'package:despesas/module/views/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: '1',
      title: 'mercado',
      value: 26.22,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'recarga cell',
      value: 30,
      date: DateTime.now(),
    )
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(
          onSubmit: _addTransaction,
        ),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
