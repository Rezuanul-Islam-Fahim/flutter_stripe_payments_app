import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Fahim'),
            accountEmail: const Text('rifahim98@gmail.com'),
            currentAccountPicture: SvgPicture.asset(
              AppConstants.defaultProfilePic,
            ),
          ),
        ],
      ),
    );
  }
}
