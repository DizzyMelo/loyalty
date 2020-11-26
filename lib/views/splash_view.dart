import 'package:flutter/material.dart';
import 'package:loyalty/controllers/auth_controller.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AuthController _controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/logo.png',
              height: 80,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.authLoggedUser(context);
  }
}
