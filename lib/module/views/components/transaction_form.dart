import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    onPressed: () {},
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
    );
  }
}
