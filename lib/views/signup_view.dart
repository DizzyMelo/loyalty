import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loyalty/components/main_button_component.dart';
import 'package:loyalty/controllers/auth_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController ctrName = TextEditingController(text: "Daniel Melo");
  TextEditingController ctrEmail =
      TextEditingController(text: "daniel@gmail.com");
  TextEditingController ctrPassword = TextEditingController(text: "1234567");

  int roleIndex = 0;

  AuthController controller = AuthController();
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
                  controller: ctrName,
                  decoration: InputDecoration(
                      labelText: 'Name', prefixIcon: Icon(LineIcons.user)),
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
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ToggleSwitch(
                    initialLabelIndex: 0,
                    minWidth: double.infinity,
                    cornerRadius: 5,
                    inactiveBgColor: Colors.grey[300],
                    labels: ['Customer', 'Business'],
                    onToggle: (index) {
                      roleIndex = index;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (_) => MainButtonComponent(
                      title: 'Signup',
                      function: () {
                        controller.signup(
                            ctrName.text,
                            ctrEmail.text,
                            roleIndex == 0 ? 'user' : 'company',
                            ctrPassword.text,
                            context);
                      },
                      loading: controller.loading),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
