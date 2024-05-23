import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/views/home/help_view.dart';
import 'package:mobile_create/app/presentation/views/home/indicate_business_view.dart';
import 'package:mobile_create/app/presentation/views/show_case/widget/advantage_showcase_widget.dart';

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
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Container(
          child: Image.asset('assets/logo_correct_nome.png'),
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
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
                  CustomColors.grey,
                  CustomColors.white,
                ]),
              ),
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Image.asset(
                      'assets/wallets/2.png',
                      height: 24,
                      width: 40,
                    ),
                    title: const Text('Cartão Correct'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Image.asset(
                      'assets/wallets/4.png',
                      height: 24,
                      width: 40,
                    ),
                    title: const Text('Cartão Refeição'),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpView()));
            },
            leading: Image.asset(
              'assets/home/help.png',
              height: 24,
              width: 40,
            ),
            title: const Text('Ajuda'),
          ),
          ListTile(
            onTap: () {},
            leading: Image.asset(
              'assets/home/message.png',
              height: 24,
              width: 40,
            ),
            title: const Text('Contato'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IndicateBusinessView()));
            },
            leading: Icon(Icons.help),
            title: const Text('Indicar comércio'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.help),
            title: const Text('Indicar pessoa'),
          ),
          ListTile(
            onTap: () {},
            leading: Image.asset(
              'assets/home/exit.png',
              height: 24,
              width: 40,
            ),
            title: const Text('Sair da conta'),
          ),
        ]),
      ),
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
              decoration: BoxDecoration(color: Color(0xFF00788C), borderRadius: BorderRadius.circular(12)),
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
                      Image.asset('assets/home/home_token.png'),
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
                        'Últimas\nCompras',
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
            const AdvantageShowCaseWidget(),
            Column(
              children: [
                Text(
                  'Mega Promoçoês',
                  style: GoogleFonts.mitr(fontSize: 20, fontWeight: FontWeight.w400),
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
