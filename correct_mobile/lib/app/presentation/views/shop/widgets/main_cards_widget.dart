import 'package:flutter/material.dart';

class MainCardsWidget extends StatelessWidget {
  final double padding;
  final Color color;
  // final List<AdModel> ads;

  const MainCardsWidget({
    super.key,
    required this.padding,
    required this.color,
    // required this.ads,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: size.height,
            width: size.width - padding * 2,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/banners/${index + 1}.png',
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
      ),

      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child:
      //    Row(children: [
      //     Container(
      //       height: size.height,
      //       width: size.width - padding * 2,
      //       decoration: ShapeDecoration(
      //         color: color,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 24,
      //     ),
      //     Container(
      //       height: size.height,
      //       width: size.width - padding * 2,
      //       decoration: ShapeDecoration(
      //         color: color,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //       ),
      //     ),
      //   ]),
      // ),
    );
  }
}
