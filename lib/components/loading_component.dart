import 'package:flutter/material.dart';
import 'package:loyalty/shared/style.dart';

class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Style.secondaryColor),
      ),
    );
  }
}
