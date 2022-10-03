import 'package:flutter/material.dart';

class UnfocusBody extends StatelessWidget {
  const UnfocusBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
