import 'package:flutter/material.dart';
import 'package:loyalty/ropositories/perk_repository.dart';
import 'package:loyalty/shared/utils.dart';
import 'package:mobx/mobx.dart';

part 'perk_controller.g.dart';

class PerkController = PerkControllerBase with _$PerkController;

abstract class PerkControllerBase with Store {
  PerkRepository repo = PerkRepository();
  @observable
  dynamic perks = {
    "data": {"data": []}
  };

  @observable
  bool loading = false;

  @action
  getPerks(context) async {
    loading = true;
    perks = await repo.getPerks('?company=5f9330cf1daf88096801b5c4');
    loading = false;
    if (perks == null) {
      Utils.showMessage('No promo found!', context);
      return;
    }
    return perks;
  }

  generatePerk(data, context) async {
    loading = true;
    dynamic res = await repo.generatePerk(data);
    loading = false;
    if (res != null) {
      Utils.showMessage('Promo added successfully!', context,
          color: Colors.teal);
    } else {
      Utils.showMessage('Something went wrong!', context);
    }
  }
}
