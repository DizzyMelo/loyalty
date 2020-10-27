import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/main_button_component.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(LineIcons.close),
          ),
          title: Text('Signup'),
          centerTitle: true,
        ),
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
                      labelText: 'Name', prefixIcon: Icon(LineIcons.user)),
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
                    title: 'Signup',
                    function: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    loading: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
