// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  late final _$confirmPassAtom =
      Atom(name: '_RegisterControllerBase.confirmPass', context: context);

  @override
  String get confirmPass {
    _$confirmPassAtom.reportRead();
    return super.confirmPass;
  }

  @override
  set confirmPass(String value) {
    _$confirmPassAtom.reportWrite(value, super.confirmPass, () {
      super.confirmPass = value;
    });
  }

  late final _$responseAtom =
      Atom(name: '_RegisterControllerBase.response', context: context);

  @override
  String get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(String value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$canRegisterAtom =
      Atom(name: '_RegisterControllerBase.canRegister', context: context);

  @override
  bool get canRegister {
    _$canRegisterAtom.reportRead();
    return super.canRegister;
  }

  @override
  set canRegister(bool value) {
    _$canRegisterAtom.reportWrite(value, super.canRegister, () {
      super.canRegister = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_RegisterControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$userIdentityInfoModelAtom = Atom(
      name: '_RegisterControllerBase.userIdentityInfoModel', context: context);

  @override
  UserIdentityInfoModel get userIdentityInfoModel {
    _$userIdentityInfoModelAtom.reportRead();
    return super.userIdentityInfoModel;
  }

  @override
  set userIdentityInfoModel(UserIdentityInfoModel value) {
    _$userIdentityInfoModelAtom.reportWrite(value, super.userIdentityInfoModel,
        () {
      super.userIdentityInfoModel = value;
    });
  }

  late final _$userAdditionalInfoModelAtom = Atom(
      name: '_RegisterControllerBase.userAdditionalInfoModel',
      context: context);

  @override
  SetFullUserInforModel get userAdditionalInfoModel {
    _$userAdditionalInfoModelAtom.reportRead();
    return super.userAdditionalInfoModel;
  }

  @override
  set userAdditionalInfoModel(SetFullUserInforModel value) {
    _$userAdditionalInfoModelAtom
        .reportWrite(value, super.userAdditionalInfoModel, () {
      super.userAdditionalInfoModel = value;
    });
  }

  late final _$addressModelAtom =
      Atom(name: '_RegisterControllerBase.addressModel', context: context);

  @override
  AddressModel get addressModel {
    _$addressModelAtom.reportRead();
    return super.addressModel;
  }

  @override
  set addressModel(AddressModel value) {
    _$addressModelAtom.reportWrite(value, super.addressModel, () {
      super.addressModel = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$registerAdditionalInfoAsyncAction = AsyncAction(
      '_RegisterControllerBase.registerAdditionalInfo',
      context: context);

  @override
  Future<void> registerAdditionalInfo() {
    return _$registerAdditionalInfoAsyncAction
        .run(() => super.registerAdditionalInfo());
  }

  late final _$registerUserAddressAsyncAction = AsyncAction(
      '_RegisterControllerBase.registerUserAddress',
      context: context);

  @override
  Future<void> registerUserAddress() {
    return _$registerUserAddressAsyncAction
        .run(() => super.registerUserAddress());
  }

  @override
  String toString() {
    return '''
confirmPass: ${confirmPass},
response: ${response},
canRegister: ${canRegister},
loading: ${loading},
userIdentityInfoModel: ${userIdentityInfoModel},
userAdditionalInfoModel: ${userAdditionalInfoModel},
addressModel: ${addressModel}
    ''';
  }
}
