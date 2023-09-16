import 'dart:math';

import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   
    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Color.fromRGBO(38, 165, 144, 1),
          secondary:Color.fromRGBO(38, 165, 144, 1),
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTrransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

 _removeTransaction(String id ){
  setState(() {
   _transactions.removeWhere((tr) => tr.id == id);
  });
 }

  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionFrom(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandScape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
        title: Text('Despesas Pessoais',style:  TextStyle(fontSize: 20 * mediaQuery.textScaleFactor,),), centerTitle: true,
        actions: <Widget>[
          if(isLandScape)
           IconButton(
            icon: Icon(_showChart?Icons.list : Icons.show_chart),
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            }
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
          ),
        ],
      );

    final availabelHeight = mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top;
    return Scaffold(
      appBar: appBar ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          //    if(isLandScape)
          //    Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Exibir grafico '),
          //       Switch.adaptive(value: _showChart, onChanged: (value){
          //       setState(() {
          //        _showChart =  value;
          //       });
          //     },),
          //   ],
          // ),
            if(_showChart || !isLandScape) 
           Container(child: Chart(_recentTrransactions),height: availabelHeight * (isLandScape ? 0.7:0.23),),
            if(!_showChart || !isLandScape)Container(child: TransactionList(_transactions,_removeTransaction),height: availabelHeight * (isLandScape ? 0.75 :0.75),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
