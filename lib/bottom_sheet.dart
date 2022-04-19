import 'package:flutter/material.dart';

class BottomSheet extends StatelessWidget {
  final String textMessage;
  final Icon icon;
  final String bottomText;
  final void Function() onTap;

  BottomSheet({
    required this.textMessage,
    required this.icon,
    required this.bottomText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(),
    );
  }
}

class bottomSheetGerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    );
  }
}
