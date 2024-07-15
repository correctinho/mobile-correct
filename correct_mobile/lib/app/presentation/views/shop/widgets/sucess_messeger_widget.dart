import 'package:flutter/material.dart';

class SucessMensegerWidget extends StatelessWidget {
  final String message;
  const SucessMensegerWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 10),
    );
  }
}
