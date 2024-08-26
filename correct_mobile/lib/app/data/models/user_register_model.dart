// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserIdentityInfoModel {
  String document;
  String email;
  String password;
  UserIdentityInfoModel({
    required this.document,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'document': document,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}

class UserAdditionalInfoModel {
  String fullname;
  String phone;
  String dateOfBirth;
  String gender;
  int salary;
  String function;
  String recommendationCode;
  String maritalStatus;
  int dependentsQuantity;
  String document2;
  String document3;
  UserAdditionalInfoModel({
    required this.fullname,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.salary,
    required this.function,
    required this.recommendationCode,
    required this.maritalStatus,
    required this.dependentsQuantity,
    required this.document2,
    required this.document3,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': fullname,
      'phone': phone,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'salary': salary,
      'function': function,
      'recommendationCode': recommendationCode,
      'maritalStatus': maritalStatus,
      'dependents_quantity': dependentsQuantity,
      'document2': document2,
      'documente3': document3,
    };
  }

  String toJson() => json.encode(toMap());
}

class AdditionalDocumentsModel {
  String selfieBase64;
  String documentFrontBase64;
  String documentBackBase64;
  String documentSelfieBase64;
  AdditionalDocumentsModel({
    required this.selfieBase64,
    required this.documentFrontBase64,
    required this.documentBackBase64,
    required this.documentSelfieBase64,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selfie_base64': selfieBase64,
      'document_front_base64': documentFrontBase64,
      'document_back_base64': documentBackBase64,
      'document_selfie_base64': documentSelfieBase64,
    };
  }

  String toJson() => json.encode(toMap());
}
