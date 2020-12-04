import 'package:flutter/material.dart';
import 'package:loyalty/ropositories/reward_repository.dart';
import 'package:loyalty/shared/SessionVariables.dart';
import 'package:loyalty/shared/utils.dart';
import 'package:mobx/mobx.dart';

part 'reward_controller.g.dart';

class RewardController = RewardControllerBase with _$RewardController;

abstract class RewardControllerBase with Store {
  RewardRepository repo = RewardRepository();
  @observable
  dynamic rewards = {
    "data": {"data": []}
  };

  @observable
  bool loading = false;

  @action
  getRewards(context) async {
    loading = true;
    rewards = await repo
        .getRewards('?user=${SessionVariables.user['_id']}&available=true');
    loading = false;

    if (rewards == null) {
      Utils.showMessage('No reward found!', context);
      return;
    }
    return rewards;
  }

  generateReward(data, context) async {
    loading = true;
    dynamic res = await repo.generateReward(data, SessionVariables.user['_id']);
    loading = false;
    if (res != null) {
      Utils.showMessage('Promo added successfully!', context,
          color: Colors.teal);
    } else {
      Utils.showMessage(
          'Something went wrong! Probably you don\'t have transactions enough',
          context);
    }
  }

  editReward(Map<String, dynamic> data, String id, BuildContext context) async {
    loading = true;
    dynamic res = await repo.editReward(data, id);
    loading = false;
    if (res != null) {
      Utils.showMessage('Document edited successfully!', context,
          color: Colors.teal);
    } else {
      Utils.showMessage('Something went wrong!', context);
    }
  }
}
