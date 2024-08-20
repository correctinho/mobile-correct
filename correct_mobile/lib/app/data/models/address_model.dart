import 'dart:convert';

import 'package:mobile_create/app/domain/entities/adress_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({required super.zipCode, required super.street, required super.neighborhood, required super.city, required super.state, super.number, super.complement, super.country});

  factory AddressModel.fromViaCep(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'],
      city: map['localidade'],
      state: map['uf'],
      street: map['logradouro'],
      neighborhood: map['bairro'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zipCode': zipCode,
      'street': street,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'number': number,
      'complement': complement,
      'country': country,
    };
  }

  String toJson() => json.encode(toMap());
}
