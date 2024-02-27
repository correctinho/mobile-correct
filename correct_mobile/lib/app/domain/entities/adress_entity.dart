// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressEntity {
  String zipCode;
  String street;
  String neighborhood;
  String city;
  String state;
  String? number;
  String? complement;
  String? country;
  
  AddressEntity({
    required this.zipCode,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
    this.number,
    this.complement,
    this.country = 'Brasil',
  });
}
