import 'package:flutter/material.dart';

class ExtractView extends StatefulWidget {
  const ExtractView({super.key});

  @override
  State<ExtractView> createState() => _ExtractState();
}

class _ExtractState extends State<ExtractView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Extrato"),
    );
  }
}