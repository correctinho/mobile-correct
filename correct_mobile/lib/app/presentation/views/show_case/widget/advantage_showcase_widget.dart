import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/presentation/controllers/partners/partners_controller.dart';
import 'package:mobile_create/app/presentation/views/show_case/show_case_food_view.dart';

class AdvantageShowCaseWidget extends StatefulWidget {
  const AdvantageShowCaseWidget({super.key});

  @override
  State<AdvantageShowCaseWidget> createState() => _AdvantageShowCaseWidgetState();
}

class _AdvantageShowCaseWidgetState extends State<AdvantageShowCaseWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var partnersController = GetIt.I.get<PartnersController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: size.height * 0.2 + 60,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
            Color.fromARGB(167, 217, 217, 217),
            Color.fromARGB(207, 217, 217, 217),
          ])),
      child: Column(
        children: [
          Text(
            'Vitrine de vantagens',
            style: GoogleFonts.mitr(
                textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
          ),
          const SizedBox(
            height: 55,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.book_outlined,
                      size: 30,
                      color: Color(0xFF00788C),
                    ),
                    Text(
                      'Educação e Cultura',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        partnersController.getPartnerscategoryModel.partnerCategory = 'saude';
                        await partnersController.getPartnersCategory();
                      },
                      child: const Icon(
                        Icons.medication_liquid_sharp,
                        size: 30,
                        color: Color(0xFF00788C),
                      ),
                    ),
                    Text(
                      'Saúde e \n bem-estar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        partnersController.getPartnerscategoryModel.partnerCategory = 'comercio';
                        await partnersController.getPartnersCategory();
                        await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShowCaseFoodView()));
                      },
                      child: const Icon(
                        Icons.store_outlined,
                        size: 30,
                        color: Color(0xFF00788C),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Comércios',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
