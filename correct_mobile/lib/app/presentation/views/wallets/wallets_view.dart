import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/user/userBenefits_controller.dart';
import 'package:mobile_create/app/presentation/views/wallets/widgets/credit_card.dart';

class WalletsView extends StatefulWidget {
  final String cardName;
  final String imagePath;
  final int balance;
  const WalletsView({super.key, required this.cardName, required this.imagePath, required this.balance});

  @override
  State<WalletsView> createState() => _WalletsViewState();
}

class _WalletsViewState extends State<WalletsView> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  @override
  Widget build(BuildContext context) {
    var userBenefitsController = GetIt.I.get<UserBenefitsController>();
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
            textStyle: const TextStyle(color: Color.fromARGB(134, 0, 0, 0), fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Observer(
        builder: (index) {
          if (userBenefitsController.userBenefitsList.isEmpty) {
            return const Center(
              child: Text('Você não possui nenhum beneficio'),
            );
          } else {
            return SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
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
                          // Positioned(
                          //   bottom: 40,
                          //   right: 180,
                          //   child: Text(
                          //     userController.getFullUserInforModel.fullname,
                          //     style: const TextStyle(color: CustomColors.backGroundColor, fontSize: 16, fontWeight: FontWeight.w400),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 530,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SALDO',
                                      style: GoogleFonts.mitr(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'R\$: ${widget.balance}',
                                      style: GoogleFonts.mitr(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'CASHBACK',
                                      style: GoogleFonts.mitr(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'R\$ 25,80',
                                      style: GoogleFonts.mitr(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ECONOMIA',
                                      style: GoogleFonts.mitr(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '48,20',
                                      style: GoogleFonts.mitr(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Color.fromRGBO(217, 217, 217, 0.5),
                                    Color.fromRGBO(217, 217, 217, 0),
                                  ],
                                ),
                              ),
                              height: 107,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset('assets/wallets/tei.png'),
                                        const Text(
                                          'Meu TEI',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(150, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset('assets/wallets/transferencia.png'),
                                        const Text(
                                          'Transferir',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(150, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset('assets/wallets/config.png'),
                                        const Text(
                                          'Configurações',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(150, 0, 0, 0)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                    'Ultimas Transações',
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
                              height: size.height * 0.2,
                              width: size.width,
                              child: const Center(
                                child: Text('Não há transações'),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
