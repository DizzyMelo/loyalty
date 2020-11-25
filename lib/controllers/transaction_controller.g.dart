// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionController on TransactionControllerBase, Store {
  final _$transactionsAtom =
      Atom(name: 'TransactionControllerBase.transactions');

  @override
  dynamic get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(dynamic value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$resumeAtom = Atom(name: 'TransactionControllerBase.resume');

  @override
  dynamic get resume {
    _$resumeAtom.reportRead();
    return super.resume;
  }

  @override
  set resume(dynamic value) {
    _$resumeAtom.reportWrite(value, super.resume, () {
      super.resume = value;
    });
  }

  final _$loadingAtom = Atom(name: 'TransactionControllerBase.loading');

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

  final _$getTransactionsAsyncAction =
      AsyncAction('TransactionControllerBase.getTransactions');

  @override
  Future getTransactions(dynamic context, String company) {
    return _$getTransactionsAsyncAction
        .run(() => super.getTransactions(context, company));
  }

  final _$getResumeAsyncAction =
      AsyncAction('TransactionControllerBase.getResume');

  @override
  Future getResume(String id, dynamic context) {
    return _$getResumeAsyncAction.run(() => super.getResume(id, context));
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
resume: ${resume},
loading: ${loading}
    ''';
  }
}
