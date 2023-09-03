import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
 final _transactions = [
  Transaction(
    id: 't1',
    title: 'novo tenis de corrida', 
    value: 310.76, 
    date: DateTime.now(),),

 Transaction(
    id: 't2',
    title: 'Conta de Luz', 
    value: 211.30, 
    date: DateTime.now(),),



    ];
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              child: Card(
                child: Text('Grafico'),
               color: Colors.blue,
               elevation: 5,
              ),
              ),
              Card(
                child: Text('Lista de  Transacoes'),
              ),
        ],
      ),
    );
  }
}
