import 'package:despesas/module/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:despesas/module/views/components/transaction_form.dart';
import 'package:despesas/module/views/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  TransactionUser({Key? key}) : super(key: key);

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
    ),
    Transaction(
      id: '3',
      title: 'mercado',
      value: 26.22,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'recarga cell',
      value: 30,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
