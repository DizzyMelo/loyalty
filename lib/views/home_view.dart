import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/row_company_component.dart';
import 'package:loyalty/controllers/transaction_controller.dart';
import 'package:loyalty/shared/SessionVariables.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TransactionController _controller = TransactionController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(SessionVariables.user['name']),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Observer(builder: (_) {
            return ColumnAnimationComponent(
              widgets: List<dynamic>.from(_controller.resume['transactions'])
                  .map((element) => RowCompanyComponent(resume: element))
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
    _controller.getResume(SessionVariables.user['_id'], context);
  }
}
