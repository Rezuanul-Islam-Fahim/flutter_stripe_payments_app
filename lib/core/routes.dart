import 'package:flutter/material.dart';

import '../views/auth/login.dart';
import '../views/auth/register.dart';

Map<String, Widget Function(BuildContext)> get routes {
  return {
    Login.route: (_) => const Login(),
    Register.route: (_) => const Register(),
  };
}
