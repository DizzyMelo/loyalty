import 'package:loyalty/ropositories/factory_repository.dart';
import 'package:loyalty/shared/SessionVariables.dart';

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
    //SessionVariables.user['_id']
    // static id
    return _factory.create(data, params: '5f93206f913be10866b1ac7d');
  }
}
