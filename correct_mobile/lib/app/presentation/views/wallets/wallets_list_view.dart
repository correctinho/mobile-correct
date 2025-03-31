import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/user/userBenefits_controller.dart';
import 'package:mobile_create/app/presentation/views/wallets/wallets_view.dart';

class WalletsListView extends StatefulWidget {
  const WalletsListView({super.key});

  @override
  State<WalletsListView> createState() => _WalletsListViewState();
}

class _WalletsListViewState extends State<WalletsListView> {
  var userBenefitsController = GetIt.I.get<UserBenefitsController>();
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
                  itemCount: userBenefitsController.userBenefitsList.length,
                  itemBuilder: (context, index) {
                    final benefits = userBenefitsController.userBenefitsList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WalletsView(
                              cardName: benefits.benefitsName,
                              imagePath: benefits.imgBenefits,
                              balance: benefits.balence,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                benefits.imgBenefits,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            benefits.benefitsName,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
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
