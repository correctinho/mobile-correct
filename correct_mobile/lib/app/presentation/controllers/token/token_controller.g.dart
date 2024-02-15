// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenController on _TokenControllerBase, Store {
  late final _$tokenAtom =
      Atom(name: '_TokenControllerBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$timeAtom =
      Atom(name: '_TokenControllerBase.time', context: context);

  @override
  int get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(int value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$startTimerAsyncAction =
      AsyncAction('_TokenControllerBase.startTimer', context: context);

  @override
  Future startTimer() {
    return _$startTimerAsyncAction.run(() => super.startTimer());
  }

  @override
  String toString() {
    return '''
token: ${token},
time: ${time}
    ''';
  }
}
