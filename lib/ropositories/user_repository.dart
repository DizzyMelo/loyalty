import 'package:loyalty/ropositories/factory_repository.dart';

class UserRepository {
  FactoryRepository _factory;
  UserRepository() {
    _factory = FactoryRepository('users');
  }

  getUsers(String params) {
    return _factory.getAll(params);
  }
}
