import 'dart:convert';

import 'package:mobile_create/app/domain/entities/adress_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.zipCode,
    required super.street,
    required super.neighborhood,
    required super.city,
    required super.state,
    super.number,
    super.complement,
    super.country,
  });

  AddressModel copyWith({
    String? zipCode,
    String? street,
    String? neighborhood,
    String? city,
    String? state,
    String? number,
    String? complement,
    String? country,
  }) {
    return AddressModel(
      zipCode: zipCode ?? this.zipCode,
      street: street ?? this.street,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      country: country ?? this.country,
    );
  }

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
      'postal_code': zipCode,
      'line1': street,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'line2': number,
      'line3': complement,
      'country': country,
    };
  }

  String toJson() => json.encode(toMap());
}
