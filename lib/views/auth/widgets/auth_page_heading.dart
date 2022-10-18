import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants.dart';

class AuthPageHeading extends StatelessWidget {
  const AuthPageHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppConstants.shoppingIcon, width: 100),
        const SizedBox(height: 30),
        RichText(
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
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
