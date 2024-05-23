import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      itemBuilder: (context, index) => SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Entregue',
                style: TextStyle(color: CustomColors.blue),
              ),
            ),
            SizedBox(
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
                    boxShadow: [BoxShadow(offset: Offset(0, 2), spreadRadius: 2, blurRadius: 2, color: CustomColors.grey)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/png/product_kart.png'),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                            child: Column(
                              children: [
                                Text('Nome'),
                                Text('Código'),
                                Text('Preço'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text('x2')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
