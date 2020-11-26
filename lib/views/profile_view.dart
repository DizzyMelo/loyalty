import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/controllers/auth_controller.dart';
import 'package:loyalty/shared/SessionVariables.dart';
import 'package:loyalty/shared/style.dart';

class ProfileView extends StatelessWidget {
  final AuthController _controller = AuthController();
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
                child: ClipOval(
                  child: Image.asset(SessionVariables.user['role'] == 'company'
                      ? 'assets/shop.png'
                      : 'assets/alien.png'),
                ),
                radius: 45,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  LineIcons.user,
                  color: Style.themeColor,
                ),
                title: Text(SessionVariables.user['name']),
              ),
              ListTile(
                leading: Icon(LineIcons.envelope_o, color: Style.themeColor),
                title: Text(SessionVariables.user['email']),
              ),
              ListTile(
                leading: Icon(LineIcons.flag_o, color: Style.themeColor),
                title: Text(SessionVariables.user['role']),
              ),
              ListTile(
                onTap: () => _settingModalBottomSheet(context),
                leading: Icon(LineIcons.arrow_right, color: Style.themeColor),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              padding: EdgeInsets.all(10),
              height: 150,
              child: Column(
                children: [
                  Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(fontSize: 15),
                  ),
                  ListTile(
                      onTap: () => _controller.logout(context),
                      title: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )),
                  ListTile(
                      onTap: () => Navigator.pop(context),
                      title: Center(
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        ),
                      )),
                ],
              ));
        });
  }
}
