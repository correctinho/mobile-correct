import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/views/shop/payment_kart.dart';

class KartView extends StatefulWidget {
  const KartView({super.key});

  @override
  State<KartView> createState() => _KartViewState();
}

class _KartViewState extends State<KartView> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 1,
            itemBuilder: (context, index) => Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(offset: Offset(0, 2), spreadRadius: 2, blurRadius: 2, color: CustomColors.grey)],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Image.asset('assets/png/product_kart.png'),
                const Column(
                  children: [
                    Text('Nome'),
                    Text('Código'),
                    Text('Preço'),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: CustomColors.grey,
                      child: IconButton(
                        color: CustomColors.white,
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _decrementCounter();
                        },
                      ),
                    ),
                    Text(
                      '$_counter',
                      style: TextStyle(fontSize: 22, color: CustomColors.secondaryGrey),
                    ),
                    CircleAvatar(
                      backgroundColor: CustomColors.blue,
                      child: IconButton(
                        color: CustomColors.white,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _incrementCounter();
                        },
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Prosseguir',
            style: TextStyle(color: CustomColors.secondaryGrey),
          ),
        ),
        Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(offset: Offset(0, 2), spreadRadius: 2, blurRadius: 2, color: CustomColors.grey)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total', style: TextStyle(color: CustomColors.secondaryGrey)),
                  Text(
                    'R\$ 156,80',
                    style: TextStyle(fontSize: 24, color: CustomColors.secondaryGrey),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 160,
                  height: 42,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: CustomColors.blue,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentKartView()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        Text(
                          'Pagamento',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
