import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallCardsWidget extends StatelessWidget {
  final double padding;
  final Color color;
  final double width;
  // final List<CategoryModel> categories;

  const SmallCardsWidget({
    super.key,
    required this.padding,
    required this.color,
    required this.width,
    // required this.categories
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
          return
              // Column(
              //   children: [
              Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: size.height,
            width: width,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: SvgPicture.asset('assets/svg/${index + 1}.svg'),
          );
          // Text(categories[index].name)
          // ],
          // );
        },
      ),
    );
  }
}
