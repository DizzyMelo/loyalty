// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perk_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerkController on PerkControllerBase, Store {
  final _$perksAtom = Atom(name: 'PerkControllerBase.perks');

  @override
  dynamic get perks {
    _$perksAtom.reportRead();
    return super.perks;
  }

  @override
  set perks(dynamic value) {
    _$perksAtom.reportWrite(value, super.perks, () {
      super.perks = value;
    });
  }

  final _$loadingAtom = Atom(name: 'PerkControllerBase.loading');

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

  final _$getPerksAsyncAction = AsyncAction('PerkControllerBase.getPerks');

  @override
  Future getPerks(dynamic context) {
    return _$getPerksAsyncAction.run(() => super.getPerks(context));
  }

  @override
  String toString() {
    return '''
perks: ${perks},
loading: ${loading}
    ''';
  }
}
