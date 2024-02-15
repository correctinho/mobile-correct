import 'package:flutter/material.dart';
import 'package:mobile_create/app/data/models/product_model.dart';

class ProductView extends StatefulWidget {
  final ProductModel productModel;
  const ProductView({super.key, required this.productModel});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.heart_broken)],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/png/${widget.productModel.productId}.png'))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Text(widget.productModel.productName),
                  Text(widget.productModel.productDescription),
                  Text(widget.productModel.discount.toString()),
                  Text(widget.productModel.total.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
