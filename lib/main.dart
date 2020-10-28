import 'package:flutter/material.dart';
import 'package:loyalty/shared/style.dart';
import 'package:loyalty/views/detail_view.dart';
import 'package:loyalty/views/home_view.dart';
import 'package:loyalty/views/login_view.dart';
import 'package:loyalty/views/profile_view.dart';
import 'package:loyalty/views/qr_code_generator_view.dart';
import 'package:loyalty/views/qr_code_scanner_view.dart';
import 'package:loyalty/views/signup_view.dart';
import 'package:loyalty/views/tabs_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loy',
      theme: ThemeData(
        primarySwatch: Style.themeColor,
        //textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginView());
            break;

          case '/signup':
            return MaterialPageRoute(builder: (context) => SignupView());
            break;

          case '/home':
            return MaterialPageRoute(builder: (context) => HomeView());
            break;

          case '/qr_code_generator':
            return MaterialPageRoute(
                builder: (context) => QrCodeGeneratorView());
            break;

          case '/qr_code_scanner':
            return MaterialPageRoute(builder: (context) => QrCodeScanner());
            break;

          case '/detail':
            return MaterialPageRoute(builder: (context) => DetailView());
            break;

          case '/tabs':
            return MaterialPageRoute(builder: (context) => TabsView());
            break;

          case '/profile':
            return MaterialPageRoute(builder: (context) => ProfileView());
            break;

          default:
            return MaterialPageRoute(builder: (context) => LoginView());
            break;
        }
      },
    );
  }
}
