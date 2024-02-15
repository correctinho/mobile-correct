import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/credit_card_list_mock.dart';
import 'package:mobile_create/app/presentation/views/wallets/wallets_view.dart';

class WalletsListView extends StatefulWidget {
  const WalletsListView({super.key});

  @override
  State<WalletsListView> createState() => _WalletsListViewState();
}

class _WalletsListViewState extends State<WalletsListView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        leading: const BackButton(
          color: CustomColors.black,
        ),
        title: Text(
          'carteira',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
            color: CustomColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
        ),
        titleSpacing: 100,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: CustomColors.white,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  'MEUS CARTÕES',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                    color: CustomColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
                )),
            Expanded(
              flex: 15,
              child: Container(
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WalletsView(
                                cardName: creditCardList[index],
                                imagePath: 'assets/wallets/${index + 1}.png')));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/wallets_list/${index + 1}.png'))),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
