import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/views/wallets/widgets/credit_card.dart';

class WalletsView extends StatefulWidget {
  final String cardName;
  final String imagePath;
  const WalletsView(
      {super.key, required this.cardName, required this.imagePath});

  @override
  State<WalletsView> createState() => _WalletsViewState();
}

class _WalletsViewState extends State<WalletsView> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: CustomColors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.cardName,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color.fromARGB(134, 0, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 23),
              height: 210,
              width: 370,
              child: Stack(
                children: [
                  CreditCardWidget(
                    imagePath: widget.imagePath,
                  ),
                  Positioned(
                    top: 20,
                    left: 200,
                    child: Text(
                      real.format(299),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 530,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/wallets/tei.png'),
                            const Text(
                              'Meu TEI',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(150, 0, 0, 0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/wallets/transferencia.png'),
                            const Text(
                              'Transferir',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(150, 0, 0, 0)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/wallets/config.png'),
                            const Text(
                              'Configurações',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(150, 0, 0, 0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/extract');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Extract',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        ImageIcon(
                          AssetImage('assets/arrow_foward.png'),
                          color: Color.fromARGB(255, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.3,
                    width: size.width,
                    child: Center(
                      child: Text('Não há transações'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
