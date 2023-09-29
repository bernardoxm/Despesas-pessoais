import 'package:despesas_pessoais/components/adaptative_button.dart';
import 'package:flutter/material.dart';

import 'adaptative_date_picker.dart';
import 'adaptative_text_field.dart';

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
    widget.onSubmit(title, value, _selectedDate);
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10.0 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleControler,
                onSubmitted: (_) => _subimitForm(),
                label: 'Titulo',
                keybordtype: TextInputType.text,
              ),
              AdaptativeTextField(
                controller: _valueControler,
                keybordtype:  TextInputType.number,
                onSubmitted: (_) => _subimitForm(),
                label: 'Valor (R\$)',
              ),
                AdaptativeDatePicker(selectedDate: _selectedDate , onDateChanged: (newDate) {setState(() {
                  _selectedDate = newDate;
                });} ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Nova Transacao',
                    onPressed: _subimitForm,
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
