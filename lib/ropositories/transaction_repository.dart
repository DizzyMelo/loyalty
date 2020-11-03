import 'package:loyalty/ropositories/factory_repository.dart';

class TransactionRepository {
  FactoryRepository _factory;
  TransactionRepository() {
    _factory = FactoryRepository('transactions');
  }

  getTransactions(String params) {
    return _factory.getAll(params);
  }

  generateTransaction(data) {
    return _factory.create(data);
  }
}
