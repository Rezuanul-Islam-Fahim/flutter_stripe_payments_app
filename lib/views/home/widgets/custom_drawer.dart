import 'dart:ui';

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
          const Spacer(),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _buildLogoutConfirm(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutConfirm(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        actionsPadding: const EdgeInsets.fromLTRB(0, 0, 20, 15),
        title: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
