import 'package:flutter/material.dart';

void main() => runApp(const FlutterStripe());

class FlutterStripe extends StatelessWidget {
  const FlutterStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Stripe'),
        ),
      ),
    );
  }
}
