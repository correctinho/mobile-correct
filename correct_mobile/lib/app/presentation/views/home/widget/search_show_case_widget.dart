import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_create/app/core/colors/colors.dart';

class SearchShowCaseWidget extends StatefulWidget {
  const SearchShowCaseWidget({super.key});

  @override
  State<SearchShowCaseWidget> createState() => _SearchShowCaseWidgetState();
}

class _SearchShowCaseWidgetState extends State<SearchShowCaseWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 280,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.white,
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22),
            )),
      ),
    );
  }
}
