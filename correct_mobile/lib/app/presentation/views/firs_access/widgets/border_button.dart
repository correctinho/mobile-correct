import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';

class BorderButon extends StatelessWidget {
  final String text;
  final double width;
  const BorderButon({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: CustomColors.colorGradientLinear01, width: 2.5)),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 18),),
      ),
    );
  }
}
