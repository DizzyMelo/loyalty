import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/shared/style.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                minRadius: 50,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  LineIcons.user,
                  color: Style.themeColor,
                ),
                title: Text('Daniel Melo'),
              ),
              ListTile(
                leading: Icon(LineIcons.envelope_o, color: Style.themeColor),
                title: Text('daniel.melo@gmail.com'),
              ),
              ListTile(
                leading: Icon(LineIcons.flag_o, color: Style.themeColor),
                title: Text('Customer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
