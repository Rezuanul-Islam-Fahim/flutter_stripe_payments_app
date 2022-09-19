import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe_payments_app/routes.dart';

import 'screens/login_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlutterStripe());
}

class FlutterStripe extends StatelessWidget {
  const FlutterStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stripe Payments',
      theme: theme,
      initialRoute: LoginScreen.route,
      routes: routes,
    );
  }
}
