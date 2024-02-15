import 'package:mobile_create/app/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {

  ProductModel(
      {required super.productId,
      required super.productOwnerId,
      required super.productName,
      required super.productDescription,
      required super.images,
      required super.discount,
      required super.total});
}
