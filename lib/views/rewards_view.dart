import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_reward_component.dart';
import 'package:loyalty/components/row_transaction_component.dart';
import 'package:loyalty/controllers/reward_controller.dart';

class RewardsView extends StatefulWidget {
  final dynamic company;

  RewardsView(
      {this.company = const {
        "id": "5fbcf144b201b407ac0577d9",
        "name": "Extreme"
      }});
  @override
  _RewardsViewState createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  RewardController _controller = RewardController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Rewards'),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Observer(
              builder: (_) => ColumnAnimationComponent(
                widgets: List<dynamic>.from(_controller.rewards['data']['data'])
                    .map((reward) => RowRewardComponent())
                    .toList(),
              ),
            )),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getRewards(context);
  }
}

// RowTransactionComponent(),
//               RowTransactionComponent(),
//               RowTransactionComponent(),
