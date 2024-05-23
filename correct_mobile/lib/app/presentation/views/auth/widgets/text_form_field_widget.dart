import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final Icon prefixIcon;
  final String hinText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({super.key, required this.onChanged, required this.keyboardType, required this.prefixIcon, required this.hinText, required this.obscureText, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hinText,
          hintStyle: const TextStyle(
            color: CustomColors.backGroundColor,
            fontSize: 18,
          ),
          errorStyle: const TextStyle(fontSize: 12)),
    );
  }
}
