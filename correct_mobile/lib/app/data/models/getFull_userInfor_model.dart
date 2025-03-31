// ignore: file_names
import 'dart:convert';

class GetFullUserInforModel {
  String document;
  String document2;
  String document3;
  String fullname;
  String displayName;
  String internalCompanyCode;
  String gender;
  String email;
  String dateOfBirth;
  String phone;
  int salary;
  bool companyOwner;
  String status;
  String function;
  String recommendationCode;
  String maritalStatus;
  int dependentsQuantity;

  GetFullUserInforModel(
      {required this.document,
      required this.document2,
      required this.document3,
      required this.fullname,
      required this.displayName,
      required this.internalCompanyCode,
      required this.gender,
      required this.email,
      required this.dateOfBirth,
      required this.phone,
      required this.salary,
      required this.companyOwner,
      required this.status,
      required this.recommendationCode,
      required this.function,
      required this.maritalStatus,
      required this.dependentsQuantity});

  factory GetFullUserInforModel.fromJson(Map<String, dynamic> json) {
    return GetFullUserInforModel(
      document: json['document'] ?? '',
      document2: json['document2'] ?? '',
      document3: json['document3'] ?? '',
      fullname: json['full_name'] ?? '',
      displayName: json['display_name'] ?? '',
      internalCompanyCode: json['internal_company_code'] ?? '',
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      phone: json['phone'] ?? '',
      salary: json['salary'] ?? 0,
      companyOwner: json['company_owner'] ?? false,
      status: json['status'] ?? '',
      recommendationCode: json['recommendation_code'] ?? '',
      function: json['function'] ?? '',
      maritalStatus: json['marital_status'] ?? '',
      dependentsQuantity: json['dependents_quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'document': document,
      'document2': document2,
      'documente3': document3,
      'full_name': fullname,
      'display_name': displayName,
      'internal_company_code': internalCompanyCode,
      'gender': gender,
      'email': email,
      'date_of_birth': dateOfBirth,
      'phone': phone,
      'salary': salary,
      'company_owner': companyOwner,
      'status': status,
      'recommendation_code': recommendationCode,
      'function': function,
      'maritalStatus': maritalStatus,
      'dependents_quantity': dependentsQuantity,
    };
  }

  String toJson() => json.encode(toMap());
}
