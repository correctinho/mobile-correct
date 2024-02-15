// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$qrValueAtom =
      Atom(name: '_HomeControllerBase.qrValue', context: context);

  @override
  String get qrValue {
    _$qrValueAtom.reportRead();
    return super.qrValue;
  }

  @override
  set qrValue(String value) {
    _$qrValueAtom.reportWrite(value, super.qrValue, () {
      super.qrValue = value;
    });
  }

  late final _$readQRCodeAsyncAction =
      AsyncAction('_HomeControllerBase.readQRCode', context: context);

  @override
  Future readQRCode() {
    return _$readQRCodeAsyncAction.run(() => super.readQRCode());
  }

  @override
  String toString() {
    return '''
qrValue: ${qrValue}
    ''';
  }
}
