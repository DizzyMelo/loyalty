import 'package:flutter/material.dart';
import 'package:loyalty/ropositories/transaction_repository.dart';
import 'package:loyalty/shared/utils.dart';
import 'package:mobx/mobx.dart';

part 'transaction_controller.g.dart';

class TransactionController = TransactionControllerBase
    with _$TransactionController;

abstract class TransactionControllerBase with Store {
  TransactionRepository repo = TransactionRepository();
  @observable
  dynamic transactions = {
    "data": {"data": []}
  };

  @observable
  dynamic resume = {"transactions": []};

  @observable
  bool loading = false;

  @action
  getTransactions(context) async {
    loading = true;
    transactions = await repo.getTransactions('');
    loading = false;
    if (transactions == null) {
      Utils.showMessage('No transaction found!', context);
      return;
    }
    return transactions;
  }

  @action
  getResume(String id, context) async {
    loading = true;
    resume = await repo.getResume('$id/resume');
    loading = false;
    if (resume == null) {
      Utils.showMessage('No transaction found!', context);
      return;
    }
    return resume;
  }

  generate(data, context) async {
    loading = true;
    var transaction = await repo.generateTransaction(data);
    loading = false;
    if (transaction == null) {
      Utils.showMessage(
          'Something went wrong when generating transaction!', context);
      return;
    }
    Navigator.pushNamedAndRemoveUntil(
        context, '/transaction_confirmation', (route) => false);
  }
}
