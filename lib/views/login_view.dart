import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/shared/style.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(LineIcons.envelope_o)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(LineIcons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(LineIcons.eye),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                MainButtonComponent(
                    title: 'Log in',
                    function: () async {
                      setState(() {
                        loading = true;
                      });
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        loading = false;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, '/tabs');
                    },
                    loading: loading),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot you password?',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Dont have an account?',
                          style: TextStyle(color: Colors.grey[800])),
                      TextSpan(
                          text: ' Register Now',
                          style: TextStyle(color: Style.themeColor))
                    ]),
                  ),
                  //child: Text('Dont have an account? Register Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
