import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:image_compression_flutter/flutter_image_compress.dart';
import 'package:mobile_create/app/core/base64_converter.dart';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/user_identity_info_model.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAdditionalDocuments_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAddress_usecase.dart';
import 'package:mobile_create/app/domain/usecases/shared/get_address_usecase.dart';
import 'package:mobx/mobx.dart';
part 'first_access_controller.g.dart';

class FirstAccessController = _FirstAccessControllerBase with _$FirstAccessController;

abstract class _FirstAccessControllerBase with Store {
  var getCepUseCase = GetIt.I.get<GetAddressUsecase>();
  var registerAddress = GetIt.I.get<RegisterAddressUseCase>();
  var registerDocuments = GetIt.I.get<RegisterAdditionalDocumentsUseCase>();

  @observable
  bool privacyPolicies = false;

  @observable
  String cep = '';

  @observable
  String street = '';

  @observable
  String neighborhood = '';

  @observable
  String state = '';

  @observable
  Uint8List? image;

  @observable
  Uint8List? front;

  @observable
  Uint8List? back;

  @observable
  String response = '';

  @observable
  AddressEntity addressEntity = AddressEntity(
    zipCode: '',
    street: '',
    neighborhood: '',
    city: '',
    state: '',
    number: '',
    complement: '',
  );

  @observable
  AddressModel addressModel = AddressModel(
    zipCode: '',
    street: '',
    neighborhood: '',
    city: '',
    state: '',
  );

  @action
  Future<void> getCep() async {
    if (cep.length >= 8) {
      final address = await getCepUseCase.getAddress(cep);
      if (address != null) {
        addressEntity = address;

        street = addressEntity.street;
        neighborhood = addressEntity.neighborhood;
        state = addressEntity.state;

        addressModel = AddressModel(
          zipCode: addressEntity.zipCode,
          street: addressEntity.street,
          neighborhood: addressEntity.neighborhood,
          city: addressEntity.city,
          state: addressEntity.state,
          number: addressEntity.number,
          complement: addressEntity.complement,
        );
      }
    }
  }

  @action
  Future<void> registerUserAddress() async {
    try {
      response = await registerAddress.registerAddress(addressModel);
    } catch (e) {
      rethrow;
    }
  }

  @observable
  AdditionalDocumentsModel additionalDocumentsModel = AdditionalDocumentsModel(
    selfieBase64: '',
    documentFrontBase64: '',
    documentBackBase64: '',
    documentSelfieBase64: '',
  );

  @action
  Future<void> saveImgToModel() async {
    if (image != null) {
      final compressedImage = await FlutterImageCompress.compressWithList(
        image!,
        quality: 50,
      );
      additionalDocumentsModel.selfieBase64 = Base64Converter.encode(compressedImage);
    }
    if (front != null) {
      final compressedfront = await FlutterImageCompress.compressWithList(
        front!,
        quality: 50,
      );
      additionalDocumentsModel.documentFrontBase64 = Base64Converter.encode(compressedfront);
    }
    if (back != null) {
      final compressedback = await FlutterImageCompress.compressWithList(
        back!,
        quality: 50,
      );
      additionalDocumentsModel.documentBackBase64 = Base64Converter.encode(compressedback);
    }
  }

  @action
  Future<void> registerAdditionalDocuments() async {
    try {
      response = await registerDocuments.registerAdditionalDocuments(additionalDocumentsModel);
    } catch (e) {
      rethrow;
    }
  }
}
