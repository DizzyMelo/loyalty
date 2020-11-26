import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class RewardIdView extends StatelessWidget {
  final dynamic reward;
  RewardIdView({@required this.reward});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('My Reward'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text(reward['perk']['title']),
                  subtitle: Text('Title'),
                ),
                ListTile(
                  title: Text(reward['perk']['description']),
                  subtitle: Text('Description'),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: PrettyQr(
                    size: 140,
                    data: reward['_id'],
                    roundEdges: true,
                    //errorCorrectLevel: QrErrorCorrectLevel.M,
                    elementColor: Colors.grey[800],
                    typeNumber: 4,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Scan the code above to use the reward',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
