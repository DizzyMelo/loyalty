import 'package:loyalty/ropositories/factory_repository.dart';

class PerkRepository {
  FactoryRepository _factory;
  PerkRepository() {
    _factory = FactoryRepository('perks');
  }

  getPerks(String params) {
    return _factory.getAll(params);
  }

  getPerk(String id) {
    return _factory.getOne(id);
  }

  generatePerk(data) {
    return _factory.create(data);
  }

  editPerk(data, id) {
    return _factory.edit(data, id);
  }
}
