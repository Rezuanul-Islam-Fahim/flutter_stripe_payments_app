import 'package:flutter/material.dart';

class AuthScreenHeading extends StatelessWidget {
  const AuthScreenHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
        text: 'Flutter',
        children: const [
          TextSpan(
            text: ' Stripe',
            style: TextStyle(color: Colors.black87),
          ),
          TextSpan(
            text: ' Payments',
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
