import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/auth_controller.dart';
import 'package:loyalty/shared/style.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController ctrEmail =
      TextEditingController(text: "daniel@gmail.com");
  TextEditingController ctrPassword = TextEditingController(text: "1234567");
  AuthController controller = AuthController();
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
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                      height: 80,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrEmail,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(LineIcons.envelope_o)),
                ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    builder: (_) => TextField(
                          controller: ctrPassword,
                          obscureText: controller.obscure,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(LineIcons.lock),
                              suffixIcon: IconButton(
                                onPressed: controller.changeObscure,
                                icon: Icon(controller.obscure
                                    ? LineIcons.eye
                                    : LineIcons.eye_slash),
                              )),
                        )),
                SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) => MainButtonComponent(
                      title: 'Log in',
                      function: () async {
                        controller.login(
                            ctrEmail.text, ctrPassword.text, context);
                      },
                      loading: controller.loading),
                ),
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
