import 'package:flutter/material.dart';
import 'package:loyalty/shared/utils.dart';

class RowTransactionComponent extends StatelessWidget {
  final dynamic transaction;

  RowTransactionComponent({this.transaction});

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
            title: Text(transaction['companyName']),
            trailing:
                Text(Utils.formatDate(DateTime.parse(transaction['date']))),
          ),
        ),
      ),
    );
  }
}
