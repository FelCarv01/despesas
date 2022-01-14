import 'package:despesas/module/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transactions,
    required this.removeTransaction,
  }) : super(key: key);

  final List<Transaction> transactions;
  final void Function(String) removeTransaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Nenhuma transação cadastrada",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Text('R\$${tr.value.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      onPressed: () => removeTransaction(tr.id),
                      color: Theme.of(context).errorColor,
                      icon: const Icon(
                        Icons.delete_forever,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
