import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/domain/entities/product_entity.dart';
import 'package:mobile_create/app/presentation/views/shop/widgets/search_bar_widget.dart';

class CustomProductsView extends StatefulWidget {
  final ProductEntity productEntity;
  const CustomProductsView({super.key, required this.productEntity});

  @override
  State<CustomProductsView> createState() => _CustomProductsViewState();
}

class _CustomProductsViewState extends State<CustomProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
        leading: const Icon(Icons.square),
        centerTitle: true,
        elevation: 0,
        actions: [
          Icon(Icons.badge),
          SizedBox(width: 5),
          CircleAvatar(radius: 15),
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: const SearchBarWidget(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tênis',
                  style: TextStyle(
                      color: CustomColors.backGroundColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                Text(
                  'Ordenar por',
                  style: TextStyle(
                      color: CustomColors.backGroundColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: MasonryGridView.builder(
            itemCount: 15,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  color: Colors.blue,
                  height: 50,
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
