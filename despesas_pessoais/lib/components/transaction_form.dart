import 'package:flutter/material.dart';

class TransactionFrom extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionFrom(this.onSubmit);

_subimitForm(){
 final title = titleControler.text;
 final value = double.tryParse(valueControler.text) ?? 0.0;
if(title.isEmpty|| value <=0){
  return;
}
   onSubmit(title, value);
}

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
                onSubmitted: (_)=>_subimitForm(),
                decoration: InputDecoration(
                  labelText: 'Titulo',
                )),
            TextField(
              controller: valueControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_)=>_subimitForm(),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
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
