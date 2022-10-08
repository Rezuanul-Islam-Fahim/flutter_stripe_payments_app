import 'package:flutter/material.dart';

import 'widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Flutter Stripe Payments'),
      ),
    );
  }
}
