import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/presentation/views/categories/categories_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme:  const IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Container(
          child: Image.asset('assets/home/logo_home.png'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/notifications');
            },
            icon: const Icon(Icons.notifications),
            tooltip: 'Notificações',
          )
        ],
      ),
      drawer: Drawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Olá, Francisco',
                  style: GoogleFonts.mitr(
                      textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/wallets-list');
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/wallets/2.png',
                          height: 24,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/wallets/4.png',
                          height: 24,
                          width: 40,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 115,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xFF00788C),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/home/pay_bills.png'),
                      Text('Pagar\nContas',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color.fromARGB(174, 217, 217, 217),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/home/token.png'),
                      Text(
                        'Token\nOffline',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color.fromARGB(174, 217, 217, 217),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/home/ultimas_compras.png'),
                      Text(
                        'Últinmas\nCompras',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            //vitrine de Vantagens
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              height: size.height * 0.3 + 40,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(167, 217, 217, 217),
                        Color.fromARGB(207, 217, 217, 217),
                      ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vitrini De Vantagens',
                    style: GoogleFonts.mitr(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.fastfood,
                            size: 30,
                            color: Color(0xFF00788C),
                          ),
                          Text(
                            'Alientação',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.medication_liquid,
                            size: 30,
                            color: Color(0xFF00788C),
                          ),
                          Text(
                            'Bem estar',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.local_gas_station_outlined,
                            size: 30,
                            color: Color(0xFF00788C),
                          ),
                          Text(
                            'Combustível',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.local_convenience_store_rounded,
                            size: 30,
                            color: Color(0xFF00788C),
                          ),
                          Text(
                            'Conveniências',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.movie,
                            size: 30,
                            color: Color(0xFF00788C),
                          ),
                          Text(
                            'Lazer',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: Color(0xFF00788C),
                          ),
                          Text(
                            'Ver tudo',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'Mega Promoçoês',
                  style: GoogleFonts.mitr(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/home/mega_promo.png'),
                    Image.asset('assets/home/mega_promo.png'),
                    Image.asset('assets/home/mega_promo.png'),
                    Image.asset('assets/home/mega_promo.png'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}