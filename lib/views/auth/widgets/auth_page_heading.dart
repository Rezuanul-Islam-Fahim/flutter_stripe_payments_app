import 'package:flutter/material.dart';

class AuthPageHeading extends StatelessWidget {
  const AuthPageHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
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