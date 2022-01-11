import 'package:despesas/module/models/transaction.dart';
import 'package:despesas/module/views/components/transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

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
    return Scaffold(
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
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Titulo',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: valueController,
                      decoration: const InputDecoration(
                        labelText: 'Valor R\$',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              print(titleController.text);
                              print(valueController.text);
                            },
                            child: const Text(
                              'Adicionar Transação',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            TransactionList(
              transactions: _transactions,
            ),
          ],
        ),
      ),
    );
  }
}
