import 'package:flutter/widgets.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
class TransactionUser extends StatefulWidget { 
  
   @override
  _TransactionUserState createState() => _TransactionUserState();
}
class _TransactionUserState extends State<TransactionUser> {  @override
  
  final _transactions = [
  
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

 
 
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(children:<Widget> [
    TransactionList(_transactions),
    TransactionFrom(),


   ],);
  }
}
