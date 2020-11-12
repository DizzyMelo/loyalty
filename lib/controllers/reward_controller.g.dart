// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RewardController on RewardControllerBase, Store {
  final _$rewardsAtom = Atom(name: 'RewardControllerBase.rewards');

  @override
  dynamic get rewards {
    _$rewardsAtom.reportRead();
    return super.rewards;
  }

  @override
  set rewards(dynamic value) {
    _$rewardsAtom.reportWrite(value, super.rewards, () {
      super.rewards = value;
    });
  }

  final _$loadingAtom = Atom(name: 'RewardControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getRewardsAsyncAction =
      AsyncAction('RewardControllerBase.getRewards');

  @override
  Future getRewards(dynamic context) {
    return _$getRewardsAsyncAction.run(() => super.getRewards(context));
  }

  @override
  String toString() {
    return '''
rewards: ${rewards},
loading: ${loading}
    ''';
  }
}
