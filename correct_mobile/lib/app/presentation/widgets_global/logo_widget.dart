// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double width;
  const LogoWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/png/logo_correct.png',
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
