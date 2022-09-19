import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

Map<String, Widget Function(BuildContext)> get routes {
  return {
    LoginScreen.route: (_) => const LoginScreen(),
  };
}
