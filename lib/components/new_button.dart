import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  NewButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.orange[500],
      child: Text(text),
    );
  }
}
