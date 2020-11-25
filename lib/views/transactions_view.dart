import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_reward_component.dart';
import 'package:loyalty/components/row_transaction_component.dart';
import 'package:loyalty/controllers/transaction_controller.dart';

class TransactionsView extends StatefulWidget {
  final dynamic company;

  TransactionsView(
      {this.company = const {
        "id": "5fbcf144b201b407ac0577d9",
        "name": "Extreme"
      }});
  @override
  _TransactionsViewState createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  TransactionController _controller = TransactionController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(widget.company['name']),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Observer(
              builder: (_) => ColumnAnimationComponent(
                widgets:
                    List<dynamic>.from(_controller.transactions['data']['data'])
                        .map((transaction) => RowTransactionComponent(
                              transaction: transaction,
                            ))
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
    _controller.getTransactions(context, widget.company['id']);
  }
}
