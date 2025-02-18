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

  generateReward(data, userId) {
    return _factory.create(data, params: userId);
  }

  editReward(data, id) {
    return _factory.edit(data, id);
  }
}
