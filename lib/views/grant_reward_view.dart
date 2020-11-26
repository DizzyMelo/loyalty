import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/reward_controller.dart';

class GrantRewardView extends StatelessWidget {
  RewardController _controller = RewardController();
  final String id;

  GrantRewardView({@required this.id});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Grant Reward'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Reward found, push the button bellow to complete grant'),
              SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) => MainButtonComponent(
                    title: 'Finish',
                    function: () => _controller
                        .editReward({'available': false}, id, context),
                    loading: _controller.loading),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(LineIcons.home),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, '/tabs', (route) => false),
        ),
      ),
    );
  }
}
