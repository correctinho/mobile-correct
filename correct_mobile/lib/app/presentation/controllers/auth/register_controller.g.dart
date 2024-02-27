// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  late final _$passwordAtom =
      Atom(name: '_RegisterControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

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

  late final _$ordinaryUserEntityAtom = Atom(
      name: '_RegisterControllerBase.ordinaryUserEntity', context: context);

  @override
  OrdinaryUserEntity get ordinaryUserEntity {
    _$ordinaryUserEntityAtom.reportRead();
    return super.ordinaryUserEntity;
  }

  @override
  set ordinaryUserEntity(OrdinaryUserEntity value) {
    _$ordinaryUserEntityAtom.reportWrite(value, super.ordinaryUserEntity, () {
      super.ordinaryUserEntity = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
password: ${password},
confirmPass: ${confirmPass},
response: ${response},
canRegister: ${canRegister},
loading: ${loading},
ordinaryUserEntity: ${ordinaryUserEntity}
    ''';
  }
}
