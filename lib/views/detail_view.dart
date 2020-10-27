import 'package:flutter/material.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_transaction_component.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('McDonalds'),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ColumnAnimationComponent(widgets: [
              RowTransactionComponent(),
              RowTransactionComponent(),
              RowTransactionComponent(),
            ])),
      ),
    );
  }
}
