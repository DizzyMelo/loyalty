import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Utils {
  static showMessage(String message, BuildContext context,
      {Color color, IconData icon}) {
    Flushbar(
      message: message,
      backgroundColor: color ?? Colors.red,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(5),
      borderRadius: 5,
      icon: Icon(
        icon ?? LineIcons.warning,
        color: Colors.white,
      ),
    )..show(context);
  }
}
