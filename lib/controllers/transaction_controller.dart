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
}
