import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/user/userBenefits_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/user_controller.dart';
import 'package:mobile_create/app/presentation/views/home/help_view.dart';
import 'package:mobile_create/app/presentation/views/home/indicate_business_view.dart';
import 'package:mobile_create/app/presentation/views/show_case/widget/advantage_showcase_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var userController = GetIt.I.get<UserController>();
    var userBenefitsController = GetIt.I.get<UserBenefitsController>();
    var size = MediaQuery.of(context).size;
    final firstName = userController.getFullUserInforModel.fullname.split(' ')[0];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: const LogoWidget(
          height: 90,
          width: 90,
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
                  'Olá, $firstName',
                  style: GoogleFonts.mitr(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 105,
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
