import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {

    final DateTime selectedDate;
    final Function (DateTime) onDateChanged;

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    

    });
  }
  AdaptativeDatePicker({
   required this.selectedDate, required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Platform.isIOS
        ?  Container(
          height: 180,
          child: CupertinoDatePicker(mode: CupertinoDatePickerMode.date, initialDateTime: DateTime.now(), minimumDate: DateTime(2019),maximumDate: DateTime.now(),onDateTimeChanged: onDateChanged,
        
          ),
        ):  Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(selectedDate == null
                            ? 'Nenhuma data selecionada! '
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}')),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Color.fromRGBO(38, 165, 144, 1)),
                      child: Text('Selecionar Data'),
                      onPressed: () => _showDatePicker(context),
                    )
                  ],
                ),
              );
  
}}
