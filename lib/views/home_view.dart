import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_company_component.dart';
import 'package:loyalty/controllers/transaction_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TransactionController _controller = TransactionController();

  List<String> trans = ['oi', 'ola', 'asd'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(LineIcons.close),
          ),
          title: Text('Daniel'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/select_user');
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Observer(builder: (_) {
            return ColumnAnimationComponent(
              widgets:
                  List<dynamic>.from(_controller.transactions['data']['data'])
                      .map((element) => RowCompanyComponent())
                      .toList(),
            );
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getTransactions(context);
  }
}
