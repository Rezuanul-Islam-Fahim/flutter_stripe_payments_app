import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

Map<String, Widget Function(BuildContext)> get routes {
  return {
    LoginScreen.route: (_) => const LoginScreen(),
    RegisterScreen.route: (_) => const RegisterScreen(),
  };
}
