import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/shared/SessionVariables.dart';

class HomeCompanyView extends StatefulWidget {
  @override
  _HomeCompanyViewState createState() => _HomeCompanyViewState();
}

class _HomeCompanyViewState extends State<HomeCompanyView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            icon: Icon(LineIcons.close),
          ),
          title: Text('Extreme'),
          //title: Text(SessionVariables.user['name']),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/select_user');
          //     },
          //     icon: Icon(Icons.add),
          //   )
          // ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: MainButtonComponent(
                title: 'New Transaction',
                function: () {
                  Navigator.pushNamed(context, '/select_user');
                },
                loading: false),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
