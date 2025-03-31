class GetpartnerscategoryModel {
  String partnerCategory;
  final int page;
  String? search;
  String? card;
  final String city;
  final bool offerProduct;
  final String businessInfoUuid;
  final String fantasyName;
  final String? title;
  final String? phone;
  final String? description;
  final String? salesType;
  final double latitude;
  final double longitude;
  final AddressPartners address;

  GetpartnerscategoryModel({
    this.partnerCategory = '',
    this.page = 1,
    this.city = '',
    this.search,
    required this.offerProduct,
    required this.businessInfoUuid,
    required this.fantasyName,
    this.title,
    this.phone,
    this.description,
    this.salesType,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.card,
  });

  factory GetpartnerscategoryModel.fromJson(Map<String, dynamic> json) => GetpartnerscategoryModel(
        offerProduct: json['offer_product'],
        businessInfoUuid: json['business_info_uuid'],
        fantasyName: json['fantasy_name'],
        title: json['title'],
        phone: json['phone'],
        description: json['description'],
        salesType: json['sales_type'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        address: AddressPartners.fromJson(json['Address']),
        partnerCategory: json['partner_category'] ?? '',
        page: json['page'] ?? 1,
        city: json['city'] ?? '',
        search: json['search'],
        card: json['item_uuid'],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partnerCategory': partnerCategory,
      'search': search,
      'page': page,
      'city': city,
      'offer_product': offerProduct,
      'business_info_uuid': businessInfoUuid,
      'fantasy_name': fantasyName,
      'title': title,
      'phone': phone,
      'description': description,
      'sales_type': salesType,
      'latitude': latitude,
      'longitude': longitude,
      'address': address.toJson(),
      'item_uuid': card,
    };
  }
}

class AddressPartners {
  final String uuid;
  final String line1;
  final String line2;
  final String? line3;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final String? neighborhood;

  AddressPartners({
    required this.uuid,
    required this.line1,
    required this.line2,
    this.line3,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    this.neighborhood,
  });

  factory AddressPartners.fromJson(Map<String, dynamic> json) {
    return AddressPartners(
      uuid: json['uuid'],
      line1: json['line1'],
      line2: json['line2'],
      line3: json['line3'],
      postalCode: json['postal_code'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      neighborhood: json['neighborhood'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'line1': line1,
      'line2': line2,
      'line3': line3,
      'postal_code': postalCode,
      'city': city,
      'state': state,
      'country': country,
      'neighborhood': neighborhood,
    };
  }
}
