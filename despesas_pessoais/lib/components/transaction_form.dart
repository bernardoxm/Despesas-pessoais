import 'package:flutter/material.dart';

class TransactionFrom extends StatelessWidget {
  
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

    @override
  Widget  build(BuildContext context) {

    
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
                          print(titleControler.text);
                          print(valueControler.text);


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
