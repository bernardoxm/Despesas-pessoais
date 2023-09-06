import 'package:flutter/material.dart';

class TransactionFrom extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionFrom(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
                controller: titleControler,
                decoration: InputDecoration(
                  labelText: 'Titulo',
                )),
            TextField(
              controller: valueControler,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('Nova Transacao'),
                  onPressed: () {
                    final title = titleControler.text;
                    final value = double.tryParse(valueControler.text) ?? 0.0;
                    onSubmit(title, value);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
