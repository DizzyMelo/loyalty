import 'package:flutter/material.dart';

class RowRewardComponent extends StatelessWidget {
  final dynamic reward;

  RowRewardComponent({@required this.reward});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 10,
        shadowColor: Colors.greenAccent,
        child: Container(
          decoration: BoxDecoration(
              //color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 5,
                  backgroundColor: Colors.greenAccent,
                ),
              ],
            ),
            title: Text(
                '${reward['perk']['company']['name']}: ${reward['perk']['title']}'),
            subtitle: Text(reward['perk']['description']),
            //trailing: Text(reward['perk']['company']['name']),
            //trailing: Text('20/10/2020'),
          ),
        ),
      ),
    );
  }
}
