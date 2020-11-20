import 'package:flutter/material.dart';

class RowPerkComponent extends StatelessWidget {
  final dynamic perk;

  RowPerkComponent({@required this.perk});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/request_reward', arguments: perk),
        child: Padding(
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
                title: Text(perk['title']),
                subtitle: Text(perk['description']),
              ),
            ),
          ),
        ));
  }
}
