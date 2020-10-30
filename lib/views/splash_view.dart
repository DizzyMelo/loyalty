import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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

  navigate() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  void initState() {
    super.initState();
    this.navigate();
  }
}
