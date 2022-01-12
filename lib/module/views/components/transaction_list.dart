import 'package:despesas/module/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
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
                  child: Row(
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Center(
                          child: Text(
                            "R\$ ${tr.value.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "OpenSans",
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/y').format(tr.date),
                            style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
