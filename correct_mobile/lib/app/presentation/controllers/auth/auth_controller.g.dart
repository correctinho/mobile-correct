// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$isFirstAtom =
      Atom(name: '_AuthControllerBase.isFirst', context: context);

  @override
  bool get isFirst {
    _$isFirstAtom.reportRead();
    return super.isFirst;
  }

  @override
  set isFirst(bool value) {
    _$isFirstAtom.reportWrite(value, super.isFirst, () {
      super.isFirst = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: '_AuthControllerBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthControllerBase.password', context: context);

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

  late final _$emailAtom =
      Atom(name: '_AuthControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$responseAtom =
      Atom(name: '_AuthControllerBase.response', context: context);

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

  late final _$faceIdAtom =
      Atom(name: '_AuthControllerBase.faceId', context: context);

  @override
  bool get faceId {
    _$faceIdAtom.reportRead();
    return super.faceId;
  }

  @override
  set faceId(bool value) {
    _$faceIdAtom.reportWrite(value, super.faceId, () {
      super.faceId = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AuthControllerBase.loading', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('_AuthControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$authFaceIdBioAsyncAction =
      AsyncAction('_AuthControllerBase.authFaceIdBio', context: context);

  @override
  Future authFaceIdBio() {
    return _$authFaceIdBioAsyncAction.run(() => super.authFaceIdBio());
  }

  late final _$isFirstTimeAsyncAction =
      AsyncAction('_AuthControllerBase.isFirstTime', context: context);

  @override
  Future<dynamic> isFirstTime() {
    return _$isFirstTimeAsyncAction.run(() => super.isFirstTime());
  }

  late final _$endFirstTimeAsyncAction =
      AsyncAction('_AuthControllerBase.endFirstTime', context: context);

  @override
  Future<dynamic> endFirstTime(String token) {
    return _$endFirstTimeAsyncAction.run(() => super.endFirstTime(token));
  }

  @override
  String toString() {
    return '''
isFirst: ${isFirst},
cpf: ${cpf},
password: ${password},
email: ${email},
response: ${response},
faceId: ${faceId},
loading: ${loading}
    ''';
  }
}
