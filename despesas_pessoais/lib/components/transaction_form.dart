import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFrom extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionFrom(this.onSubmit);

  @override
  State<TransactionFrom> createState() => _TransactionFromState();
}

class _TransactionFromState extends State<TransactionFrom> {
  final _titleControler = TextEditingController();

  final _valueControler = TextEditingController();
     DateTime _selectedDate = DateTime.now();

  _subimitForm() {
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value,_selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate){
      if(pickedDate == null){
        return ; 
    
    }
     setState(() {
       _selectedDate = pickedDate;
     });

  });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding:  EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10.0 + MediaQuery.of(context).viewInsets.bottom,


          ),
          child: Column(
            children: <Widget>[
              TextField(
                  controller: _titleControler,
                  onSubmitted: (_) => _subimitForm(),
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                  )),
              TextField(
                controller: _valueControler,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _subimitForm(),
                decoration: InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(child: Text(_selectedDate == null ?'Nenhuma data selecionada! ':'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}')),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Color.fromRGBO(38, 165, 144, 1)),
                      child: Text('Selecionar Data'),
                      onPressed: _showDatePicker,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text('Nova Transacao'),
                    onPressed: () {
                      _subimitForm();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(38, 165, 144, 1), onPrimary: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
