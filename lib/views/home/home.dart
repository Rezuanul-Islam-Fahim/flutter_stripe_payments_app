import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stripe Payments'),
      ),
    );
  }
}