import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';

class PastPurchasesView extends StatefulWidget {
  const PastPurchasesView({super.key});

  @override
  State<PastPurchasesView> createState() => _PastPurchasesViewState();
}

class _PastPurchasesViewState extends State<PastPurchasesView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          const Text('Data'),
          Expanded(
            child: SizedBox(
              height: 3 * 95,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: CustomColors.grey)
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('name'),
                        Column(
                          children: [
                            Text('Nome'),
                            Text('Código'),
                            Text('Preço'),
                          ],
                        ),
                      Text('x2')
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
