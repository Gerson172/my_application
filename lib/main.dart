import 'package:flutter/material.dart';
import 'bottom_sheet.dart';

// ponto de partida do código
void main() => runApp(NubankApp());

class NubankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home serve para inicializar o materialApp
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Editor(
              controlador: controladorCampoNumeroConta,
              rotulo: 'Número da conta',
              dica: '0000',
              icone: null),
          Editor(
              controlador: controladorCampoValor,
              rotulo: 'Valor transferencia',
              dica: '0.00',
              icone: Icons.monetization_on),
          Center(
            child: ElevatedButton(
              child: Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.0),
                primary: Colors.purple,
                textStyle: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                //debugPrint('$transferenciaCriada');
                _criaTransferencia(context);
                //## Tentativa de fazer um modal de confirmação
                // else {
                //   showModalBottomSheet(
                //     context: context,
                //     builder: (context) {
                //       return Center(
                //         child: Container(
                //           height: 250,
                //           child: Column(
                //             // mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               ListTile(
                //                 leading: Icon(
                //                   Icons.warning_amber_rounded,
                //                   color: Colors.purple,
                //                   size: 40,
                //                   textDirection: TextDirection.ltr,
                //                 ),
                //                 title: Text(
                //                   'O número da conta ou valor da \n transferência está em branco!',
                //                   style: TextStyle(fontSize: 20),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 30,
                //               ),
                //               SizedBox(
                //                 height: 50,
                //                 width: 170,
                //                 child: ElevatedButton(
                //                   onPressed: () {
                //                     Navigator.pop(context);
                //                   },
                //                   child: Text('Ok'),
                //                   style: ElevatedButton.styleFrom(
                //                     padding: EdgeInsets.all(16.0),
                //                     primary: Colors.purple,
                //                     textStyle: TextStyle(fontSize: 24),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(18.0),
                //     ),
                //   );
                // }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador; // controller de text
  final String rotulo;
  final String dica;
  final IconData? icone;

  const Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador, // pega os dados do input
        style: TextStyle(fontSize: 16.0), // sempre de 8 em 8
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

// tela de listaTransferencia
class ListaTransferencia extends StatelessWidget {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Transferências'),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: _transferencias.length, // dados esperados
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return itemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('Chegou no then do future');
            debugPrint('$transferenciaRecebida');
            _transferencias.add(transferenciaRecebida!); // adiciona na variavel
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
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

class Transferencia {
  final double? valor;
  final int? numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
