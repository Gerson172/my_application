import 'package:flutter/material.dart';
import 'package:my_application/screens/transferencia/lista.dart';
//import 'bottom_sheet.dart';

// ponto de partida do código
void main() => runApp(NubankApp());

class NubankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home serve para inicializar o materialApp
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple[600],
          secondary: Colors.purple[600],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple[600],
          textTheme: ButtonTextTheme.primary,
        ),
      ),

      home: ListaTransferencia(),
    );
  }
}

