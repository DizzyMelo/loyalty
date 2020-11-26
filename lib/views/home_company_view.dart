import 'package:flutter/material.dart';
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
          title: Text(SessionVariables.user['name']),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainButtonComponent(
                  title: 'New Transaction',
                  function: () {
                    Navigator.pushNamed(context, '/select_user');
                  },
                  loading: false),
              SizedBox(
                height: 20,
              ),
              MainButtonComponent(
                  title: 'Grant Reward',
                  function: () {
                    Navigator.pushNamed(context, '/qr_code_scanner',
                        arguments: '/grant_reward');
                  },
                  loading: false),
            ],
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
