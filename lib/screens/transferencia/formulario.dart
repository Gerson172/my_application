import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoNumConta = 'Número da conta';
const _dicaCampoNumConta = '0000';
const _rotuloCampoValor = 'Valor transferencia';
const _dicaCampoValor = '0000.0';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumConta,
                dica: _dicaCampoNumConta,
                icone: null),
            Editor(
                controlador: controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            Center(
              child: ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 24),
                  padding: EdgeInsets.all(18.0),
                ),
                onPressed: () {
                  //debugPrint('$transferenciaCriada');
                  _criaTransferencia(context);
                  //## Tentativa de fazer um modal de confirmação
                },
              ),
            ),
          ],
        ),
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
