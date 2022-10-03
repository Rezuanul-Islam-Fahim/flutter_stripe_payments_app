import 'package:flutter/material.dart';

class UnfocusScope extends StatelessWidget {
  const UnfocusScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
