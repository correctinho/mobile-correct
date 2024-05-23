import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/views/shop/widgets/sucess_messeger_widget.dart';

class PaymentKartView extends StatefulWidget {
  const PaymentKartView({super.key});

  @override
  State<PaymentKartView> createState() => _PaymentKartViewState();
}

class _PaymentKartViewState extends State<PaymentKartView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        iconTheme: const IconThemeData(color: CustomColors.white),
        title: const Text(
          'PAGAMENTO',
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Item: 3'), Text('R\$:56,80')],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Entrega até 5 dias úteis'),
                Text('Gratis'),
              ],
            ),
            const Row(
              children: [
                Text('Endereço'),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.edit)
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 61,
              width: size.width,
              decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 250, 182), border: Border.all(color: const Color.fromARGB(71, 1, 43, 66))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'ENDEREÇO DE ENTREGA',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          Text('client.address'),
                        ],
                      ),
                      const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Text('Pagamento'),
                  Container(
                    width: size.width,
                    height: size.height * 0.05,
                    color: CustomColors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/wallets/2.png',
                                height: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('Correct')
                            ],
                          ),
                          const Icon(
                            Icons.check_box,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.05,
                    color: CustomColors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/wallets/4.png',
                                height: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('Vale Refeição')
                            ],
                          ),
                          const Icon(
                            Icons.check_box,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.2,
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
                  Container(
                    width: 160,
                    height: 42,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: CustomColors.blue,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          Text(
                            'Concluir Compra',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
