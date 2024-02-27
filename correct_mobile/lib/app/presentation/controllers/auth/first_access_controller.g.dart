// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_access_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirstAccessController on _FirstAccessControllerBase, Store {
  late final _$privacyPoliciesAtom = Atom(
      name: '_FirstAccessControllerBase.privacyPolicies', context: context);

  @override
  bool get privacyPolicies {
    _$privacyPoliciesAtom.reportRead();
    return super.privacyPolicies;
  }

  @override
  set privacyPolicies(bool value) {
    _$privacyPoliciesAtom.reportWrite(value, super.privacyPolicies, () {
      super.privacyPolicies = value;
    });
  }

  late final _$cepAtom =
      Atom(name: '_FirstAccessControllerBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$streetAtom =
      Atom(name: '_FirstAccessControllerBase.street', context: context);

  @override
  String get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  late final _$neighborhoodAtom =
      Atom(name: '_FirstAccessControllerBase.neighborhood', context: context);

  @override
  String get neighborhood {
    _$neighborhoodAtom.reportRead();
    return super.neighborhood;
  }

  @override
  set neighborhood(String value) {
    _$neighborhoodAtom.reportWrite(value, super.neighborhood, () {
      super.neighborhood = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_FirstAccessControllerBase.state', context: context);

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_FirstAccessControllerBase.image', context: context);

  @override
  Uint8List? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(Uint8List? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$frontAtom =
      Atom(name: '_FirstAccessControllerBase.front', context: context);

  @override
  Uint8List? get front {
    _$frontAtom.reportRead();
    return super.front;
  }

  @override
  set front(Uint8List? value) {
    _$frontAtom.reportWrite(value, super.front, () {
      super.front = value;
    });
  }

  late final _$backAtom =
      Atom(name: '_FirstAccessControllerBase.back', context: context);

  @override
  Uint8List? get back {
    _$backAtom.reportRead();
    return super.back;
  }

  @override
  set back(Uint8List? value) {
    _$backAtom.reportWrite(value, super.back, () {
      super.back = value;
    });
  }

  late final _$addressEntityAtom =
      Atom(name: '_FirstAccessControllerBase.addressEntity', context: context);

  @override
  AddressEntity get addressEntity {
    _$addressEntityAtom.reportRead();
    return super.addressEntity;
  }

  @override
  set addressEntity(AddressEntity value) {
    _$addressEntityAtom.reportWrite(value, super.addressEntity, () {
      super.addressEntity = value;
    });
  }

  late final _$getCepAsyncAction =
      AsyncAction('_FirstAccessControllerBase.getCep', context: context);

  @override
  Future<void> getCep() {
    return _$getCepAsyncAction.run(() => super.getCep());
  }

  @override
  String toString() {
    return '''
privacyPolicies: ${privacyPolicies},
cep: ${cep},
street: ${street},
neighborhood: ${neighborhood},
state: ${state},
image: ${image},
front: ${front},
back: ${back},
addressEntity: ${addressEntity}
    ''';
  }
}
