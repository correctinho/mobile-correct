import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';

class OrdinaryUserModel extends OrdinaryUserEntity {
  OrdinaryUserModel(
      {required super.document,
      required super.email,
      required super.document2,
      required super.document3,
      required super.fullName,
      required super.gender,
      required super.dateOfBirth,
      required super.phone,
      required super.salary,
      required super.function,
      required super.recomendationCode,
      required super.maritalStatus,
      required super.dependentsQuantity,
      required super.line1,
      required super.line2,
      required super.line3,
      required super.postalCode,
      required super.neighborhood,
      required super.city,
      required super.state,
      required super.country,
      required super.selfieBase64,
      required super.documentFrontBase64,
      required super.documentBackBase64,
      required super.documentSelfieBase64,
      required super.password});

  factory OrdinaryUserModel.fromJson(Map<String, dynamic> json) => OrdinaryUserModel(
        document: json['document'],
        email: json['email'],
        document2: json['document2'],
        document3: json['document3'],
        fullName: json['full_name'],
        gender: json['gender'],
        dateOfBirth: json['date_of_birth'],
        phone: json['phone'],
        salary: json['salary'],
        function: json['function'],
        recomendationCode: json['recomendation_code'],
        maritalStatus: json['martial_status'],
        dependentsQuantity: json['dependents_quantity'],
        line1: json['line1'],
        line2: json['line2'],
        line3: json['line3'],
        postalCode: json['postal_code'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        selfieBase64: json['selfie_base64'],
        documentFrontBase64: json['document_front_base64'],
        documentBackBase64: json['document_back_base64'],
        documentSelfieBase64: json['document_selfie_base64'],
        password: '',
      );

  Map<String, dynamic> toJson() => {
        'document': document,
        'email': email,
        'document2': document2,
        'document3': document3,
        'full_name': fullName,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        'phone': phone,
        'salary': salary,
        'function': function,
        'recomendation_code': recomendationCode,
        'martial_status': maritalStatus,
        'dependents_quantity': dependentsQuantity,
        'line1': line1,
        'line2': line2,
        'line3': line3,
        'postal_code': postalCode,
        'neighborhood': neighborhood,
        'city': city,
        'state': state,
        'country': country,
        'selfie_base64': selfieBase64,
        'document_front_base64': documentFrontBase64,
        'document_back_base64': documentBackBase64,
        'document_selfie_base64': documentSelfieBase64,
      };
}
