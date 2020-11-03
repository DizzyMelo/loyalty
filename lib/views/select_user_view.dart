import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/column_animation_component.dart';
import 'package:loyalty/components/default_textfield_component.dart';
import 'package:loyalty/controllers/user_controller.dart';

class SelectUserView extends StatelessWidget {
  final UserController _userController = UserController();
  //final TransactionController _transactionController = TransactionController();
  final TextEditingController ctrEmail =
      TextEditingController(text: 'daniel@gmail.com');
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
              DefaultTextfieldComponent(
                controller: ctrEmail,
                icon: LineIcons.envelope_o,
                showFunctionIcon: true,
                iconFunction: LineIcons.search,
                sendOnSubmit: false,
                function: search,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Observer(builder: (_) {
                  return ColumnAnimationComponent(
                    widgets: List<dynamic>.from(
                            _userController.users['data']['data'])
                        .map(
                          (element) => ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/generate_transaction',
                                  arguments: element);
                            },
                            title: Text(element['name']),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // MainButtonComponent(
              //   title: 'Generate',
              //   function: () {
              //     Map<String, dynamic> data = {
              //       "user": "5f93206f913be10866b1ac7d",
              //       "company": "5f9330cf1daf88096801b5c4"
              //     };

              //     _transactionController.generate(data, context);
              //   },
              //   loading: false,
              // )
            ],
          ),
        ),
      ),
    );
  }

  void search() {
    _userController.getUsers('?email=${ctrEmail.text}', null);
  }
}
