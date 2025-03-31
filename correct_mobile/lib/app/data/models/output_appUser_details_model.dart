import 'dart:convert';

class OutputAppUserDetailsModel {
  bool status;
  bool userInfo;
  bool userAddress;
  bool userValidation;

  OutputAppUserDetailsModel({
    required this.status,
    required this.userInfo,
    required this.userAddress,
    required this.userValidation,
  });

  factory OutputAppUserDetailsModel.fromJson(Map<String, dynamic> json) {
    return OutputAppUserDetailsModel(
      status: json['status'],
      userInfo: json['UserInfo'],
      userAddress: json['UserAddress'],
      userValidation: json['UserValidation'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'UserInfo': userInfo,
      'UserAddress': userAddress,
      'UserValidation': userValidation,
    };
  }

  String toJson() => json.encode(toMap());
}
