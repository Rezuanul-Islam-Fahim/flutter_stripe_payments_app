import 'package:flutter/material.dart';

import '../views/auth/login.dart';
import '../views/auth/register.dart';
import '../views/home/home.dart';
import '../views/splash.dart';

Map<String, Widget Function(BuildContext)> get routes {
  return {
    Splash.route: (_) => const Splash(),
    Login.route: (_) => const Login(),
    Register.route: (_) => const Register(),
    Home.route: (_) => const Home(),
  };
}
