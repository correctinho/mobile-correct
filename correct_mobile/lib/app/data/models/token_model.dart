import 'package:mobile_create/app/domain/entities/token.dart';

class TokenModel extends TokenEntity {
  TokenModel({required super.value, required super.active});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      value: json['value'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'active': active,
    };
  }

}
