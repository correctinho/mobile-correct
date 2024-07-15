import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';

class ShowCaseCardWidget extends StatelessWidget {
  const ShowCaseCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.grey),
          borderRadius: BorderRadius.circular(22),
        ),
        height: size.height * 0.3,
        width: size.width * 0.9,
        child: Row(
          children: [
            Image.asset('assets/png/super_market.png'),
            const SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Mercado Barato',
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'Os melhores preços da\ncidade',
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: CustomColors.blue,
                    ),
                    height: 36,
                    width: size.width * 0.4,
                    child: const Center(
                      child: Text(
                        'ver oferta',
                        style: TextStyle(color: CustomColors.white),
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    Text('0.5 km')
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.map,
                      color: CustomColors.blue,
                    ),
                    Text('Abrir em Mapas')
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
