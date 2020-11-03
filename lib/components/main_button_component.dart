import 'package:flutter/material.dart';
import 'package:loyalty/components/loading_component.dart';
import 'package:loyalty/shared/style.dart';

class MainButtonComponent extends StatelessWidget {
  final String title;
  final Function function;
  final bool loading;

  MainButtonComponent(
      {@required this.title, @required this.function, @required this.loading});
  @override
  Widget build(BuildContext context) {
    if (loading) return LoadingComponent();
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
