import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvantageShowCaseWidget extends StatefulWidget {
  const AdvantageShowCaseWidget({super.key});

  @override
  State<AdvantageShowCaseWidget> createState() => _AdvantageShowCaseWidgetState();
}

class _AdvantageShowCaseWidgetState extends State<AdvantageShowCaseWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      height: size.height * 0.3 + 40,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
            Color.fromARGB(167, 217, 217, 217),
            Color.fromARGB(207, 217, 217, 217),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Vitrine de vantagens',
            style: GoogleFonts.mitr(
                textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
              ),
              Expanded(
                child: Column(
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
              ),
              Expanded(
                child: Column(
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
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
              ),
              Expanded(
                child: Column(
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
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/show-case-view');
                  },
                  child: Column(
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
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
