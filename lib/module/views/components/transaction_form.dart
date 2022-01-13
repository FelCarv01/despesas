import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime? _dateTimeSelected = DateTime.now();

  _submitForm() {
    final date = _dateTimeSelected;
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.00;
    if (title.isEmpty || value <= 0 || _dateTimeSelected == null) {
      return;
    }
    widget.onSubmit(title, value, date!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateTimeSelected = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor R\$',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text(_dateTimeSelected == null
                      ? "nenhuma data selecionada!"
                      : DateFormat('d/M/y').format(_dateTimeSelected!)),
                  TextButton(
                    onPressed: () {
                      _showDatePicker();
                    },
                    child: const Text(
                      "Selecionar Data",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _submitForm,
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
