import 'dart:math';
import 'dart:ui';

import 'package:despesas/module/models/transaction.dart';
import 'package:despesas/module/views/components/chart.dart';
import 'package:despesas/module/views/components/transaction_form.dart';
import 'package:despesas/module/views/components/transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime dateTime) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: dateTime,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere(
        (tr) => tr.id == id,
      );
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmit: _addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        ),
      ],
      title: Text(
        "Despesas Pessoais",
        style: TextStyle(fontSize: 20 * MediaQuery.of(context).textScaleFactor),
      ),
    );
    final availableHeigth = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: availableHeigth * .25,
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            SizedBox(
              height: availableHeigth * .75,
              child: TransactionList(
                transactions: _transactions,
                removeTransaction: _removeTransaction,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
