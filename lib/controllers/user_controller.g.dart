// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on UserControllerBase, Store {
  final _$usersAtom = Atom(name: 'UserControllerBase.users');

  @override
  dynamic get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(dynamic value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$loadingAtom = Atom(name: 'UserControllerBase.loading');

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

  final _$getUsersAsyncAction = AsyncAction('UserControllerBase.getUsers');

  @override
  Future getUsers(dynamic params, dynamic context) {
    return _$getUsersAsyncAction.run(() => super.getUsers(params, context));
  }

  @override
  String toString() {
    return '''
users: ${users},
loading: ${loading}
    ''';
  }
}
