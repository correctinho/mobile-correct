// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double height;
  final double borderRadius;

  const MainButton({
    Key? key,
    required this.text,
    required this.color,
    required this.height,
    required this.textColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
    );
  }
}
