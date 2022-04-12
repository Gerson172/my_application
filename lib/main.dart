import 'package:flutter/material.dart';

// ponto de partida do código
void main() => runApp(Column(
      children: <Widget>[
        Text(
          'Deliver features faster',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Craft beautiful UIs',
          textDirection: TextDirection.ltr,
        ),
        Column(
          children: <Widget> [
            Text(
              'Craft beautiful UIs',
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
      ],
    ));
