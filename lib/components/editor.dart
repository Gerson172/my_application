import 'package:flutter/material.dart';

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
