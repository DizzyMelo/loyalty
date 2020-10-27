import 'package:flutter/material.dart';
import 'package:loyalty/shared/style.dart';

class MainButtonComponent extends StatelessWidget {
  final String title;
  final Function function;
  final bool loading;

  MainButtonComponent(
      {@required this.title, @required this.function, this.loading});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: RaisedButton(
        elevation: 10,
        color: Style.themeColor,
        onPressed: function,
        child: Text(title),
      ),
    );
  }
}
