import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/reward_controller.dart';
import 'package:loyalty/shared/style.dart';

class RequestRewardView extends StatefulWidget {
  final dynamic perk;

  RequestRewardView({@required this.perk});
  @override
  _RequestRewardViewState createState() => _RequestRewardViewState();
}

class _RequestRewardViewState extends State<RequestRewardView> {
  RewardController _controller = RewardController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Reward'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.perk['title'] ?? 'title',
                style: Style.title,
              ),
              Text(
                widget.perk['description'] ?? 'description',
                style: Style.description,
              ),
              SizedBox(
                height: 10,
              ),
              Text('${widget.perk['rounds']} iterations' ?? 'description'),
              SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) => MainButtonComponent(
                    title: 'Request Reward',
                    function: () {
                      Map<String, dynamic> data = {
                        "perkId": widget.perk['_id'],
                        "company": widget.perk['company'],
                      };
                      _controller.generateReward(data, context);
                    },
                    loading: _controller.loading),
              )
            ],
          ),
        ),
      ),
    );
  }
}
