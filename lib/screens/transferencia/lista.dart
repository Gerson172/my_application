import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferência';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    // list title estático
    // widget._transferencias.add(Transferencia(100.0, 100));
    // widget._transferencias.add(Transferencia(200.0, 200));
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_tituloAppBar),
        ),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length, // dados esperados
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return itemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              // setState é um callback, serve para executar o build apos
              // a atualização de dados
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
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
