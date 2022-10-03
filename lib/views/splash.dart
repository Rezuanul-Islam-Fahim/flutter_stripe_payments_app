import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth/login.dart';
import 'home/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  static const route = '/splash';

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? const Home()
        : const Login();
  }
}
