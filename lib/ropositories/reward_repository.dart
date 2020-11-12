import 'package:loyalty/ropositories/factory_repository.dart';

class RewardRepository {
  FactoryRepository _factory;
  RewardRepository() {
    _factory = FactoryRepository('rewards');
  }

  getRewards(String params) {
    return _factory.getAll(params);
  }

  getReward(String id) {
    return _factory.getOne(id);
  }

  generateReward(data) {
    return _factory.create(data);
  }
}
