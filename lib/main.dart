import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loyalty/shared/style.dart';
import 'package:loyalty/views/edit_perk_view.dart';
import 'package:loyalty/views/rewards_view.dart';
import 'package:loyalty/views/generate_transaction_view.dart';
import 'package:loyalty/views/home_company_view.dart';
import 'package:loyalty/views/perks_view.dart';
import 'package:loyalty/views/request_reward_view.dart';
import 'package:loyalty/views/select_company_view.dart';
import 'package:loyalty/views/select_user_view.dart';
import 'package:loyalty/views/home_view.dart';
import 'package:loyalty/views/login_view.dart';
import 'package:loyalty/views/profile_view.dart';
import 'package:loyalty/views/qr_code_generator_view.dart';
import 'package:loyalty/views/qr_code_scanner_view.dart';
import 'package:loyalty/views/signup_view.dart';
import 'package:loyalty/views/splash_view.dart';
import 'package:loyalty/views/tabs_view.dart';
import 'package:loyalty/views/transaction_confirmation_view.dart';
import 'package:loyalty/views/transactions_view.dart';

import 'views/add_perk_view.dart';

void main() async {
  await DotEnv().load('config.env');
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
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(builder: (context) => SplashView());
            break;

          case '/login':
            return MaterialPageRoute(builder: (context) => LoginView());
            break;

          case '/signup':
            return MaterialPageRoute(builder: (context) => SignupView());
            break;

          case '/home':
            return MaterialPageRoute(builder: (context) => HomeView());
            break;

          case '/home_company':
            return MaterialPageRoute(builder: (context) => HomeCompanyView());
            break;

          case '/qr_code_generator':
            return MaterialPageRoute(
                builder: (context) => QrCodeGeneratorView());
            break;

          case '/qr_code_scanner':
            return MaterialPageRoute(builder: (context) => QrCodeScanner());
            break;

          case '/rewards':
            return MaterialPageRoute(
                builder: (context) => RewardsView(
                      company: settings.arguments,
                    ));
            break;

          case '/transactions':
            return MaterialPageRoute(
                builder: (context) => TransactionsView(
                      company: settings.arguments,
                    ));
            break;

          case '/tabs':
            return MaterialPageRoute(builder: (context) => TabsView());
            break;

          case '/profile':
            return MaterialPageRoute(builder: (context) => ProfileView());
            break;

          case '/perks':
            return MaterialPageRoute(
                builder: (context) => PerkView(
                      company: settings.arguments,
                    ));
            break;

          case '/add_perk':
            return MaterialPageRoute(builder: (context) => AddPerkView());
            break;

          case '/edit_perk':
            return MaterialPageRoute(
                builder: (context) => EditPerkView(
                      perk: settings.arguments,
                    ));
            break;

          case '/select_user':
            return MaterialPageRoute(builder: (context) => SelectUserView());
            break;

          case '/select_company':
            return MaterialPageRoute(builder: (context) => SelectCompanyView());
            break;

          case '/request_reward':
            return MaterialPageRoute(
                builder: (context) => RequestRewardView(
                      perk: settings.arguments,
                    ));
            break;

          case '/generate_transaction':
            return MaterialPageRoute(
              builder: (context) => GenerateTransactionView(
                user: settings.arguments,
              ),
            );
            break;

          case '/transaction_confirmation':
            return MaterialPageRoute(
                builder: (context) => TransactionConfirmationView(
                      transaction: settings.arguments,
                    ));
            break;

          default:
            return MaterialPageRoute(builder: (context) => LoginView());
            break;
        }
      },
    );
  }
}
