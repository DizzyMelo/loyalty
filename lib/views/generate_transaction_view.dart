import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/transaction_controller.dart';
import 'package:loyalty/shared/SessionVariables.dart';

class GenerateTransactionView extends StatefulWidget {
  final dynamic user;

  GenerateTransactionView({@required this.user});
  @override
  _GenerateTransactionViewState createState() =>
      _GenerateTransactionViewState();
}

class _GenerateTransactionViewState extends State<GenerateTransactionView> {
  TransactionController _controller = TransactionController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Select User'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.user['name']),
              Text(widget.user['email']),
              SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) => MainButtonComponent(
                    title: 'Generate Transaction',
                    function: () {
                      Map<String, dynamic> data = {
                        "user": widget.user['_id'],
                        "company": SessionVariables.user['_id'],
                        "companyName": SessionVariables.user['name']
                      };
                      _controller.generate(data, context);
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
//5f9330cf1daf88096801b5c4
