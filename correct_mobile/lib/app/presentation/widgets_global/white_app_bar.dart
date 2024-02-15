import 'package:flutter/material.dart';

class WhiteAppBar extends StatelessWidget {
  const WhiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Image.asset('assets/logo_correct_nome.png'),
    );
  }
}
