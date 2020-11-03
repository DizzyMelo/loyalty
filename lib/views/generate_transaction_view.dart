import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/default_textfield_component.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/transaction_controller.dart';

class GenerateTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionController controller = TransactionController();
    TextEditingController ctrEmail = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Generate Transaction'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextfieldComponent(
                  controller: ctrEmail, icon: LineIcons.envelope_o),
              SizedBox(
                height: 10,
              ),
              MainButtonComponent(
                title: 'Generate',
                function: () {
                  Map<String, dynamic> data = {
                    "user": "5f93206f913be10866b1ac7d",
                    "company": "5f9330cf1daf88096801b5c4"
                  };

                  controller.generate(data, context);
                },
                loading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
