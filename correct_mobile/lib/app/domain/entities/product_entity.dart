// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEntity {
  String productId;
  String productOwnerId;
  String productName;
  String productDescription;
  List<String> images;
  double discount;
  double total;

  ProductEntity({
    required this.productId,
    required this.productOwnerId,
    required this.productName,
    required this.productDescription,
    required this.images,
    required this.discount,
    required this.total,
  });
}
