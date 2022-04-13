import 'package:flutter/material.dart';

// ponto de partida do código
void main() => runApp(MaterialApp(
      // home serve para inicializar o materialApp
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Transferências'),
          ),
          backgroundColor: Colors.purple,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
        ),
        body: ListaTransferencia(),
      ),
    ));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        itemTransferencia(Transferencia(200.00, 1001)),
        itemTransferencia(Transferencia(300.00, 1002)),
        itemTransferencia(Transferencia(400.00, 1003)),
      ],
    );
  }
}

class itemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  itemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('valor: ' + _transferencia.valor.toString()),
        subtitle: Text('nº conta ' + _transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
