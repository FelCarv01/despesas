import 'package:despesas/module/models/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:despesas/module/views/components/transaction_form.dart';
import 'package:despesas/module/views/components/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Navigator.of(context).pop();
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
        elevation: 2,
        title: const Text("Despesas Pessoais"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Text('Grafico'),
                elevation: 5,
              ),
            ),
            TransactionList(
              transactions: _transactions,
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
