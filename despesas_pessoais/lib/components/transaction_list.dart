import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma Transacao  Cadastrada!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    './assets/images/604a7b7fa322d30f1243b3c1_EGA Futura Gastos 512.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              
              
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          'R\$${tr.value}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? ElevatedButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          label: Text('Excluir'),
                        style: ElevatedButton.styleFrom( primary: Theme.of(context).errorColor,
                        
                        
                        ))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => onRemove(tr.id),
                          color: Theme.of(context).copyWith().errorColor,
                        ),
                ),
              );
            },
          );
  }
}
