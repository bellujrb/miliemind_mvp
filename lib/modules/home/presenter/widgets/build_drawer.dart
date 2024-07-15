import 'package:flutter/material.dart';
import 'package:miliemind_mvp/core/extensions/build_context_utils.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SizedBox(
            width: context.mediaWidth * 1.0,
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'MENU',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.dashboard, color: Colors.white),
          title: const Text(
            'Inicio',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          tileColor: Colors.pinkAccent,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(Icons.exit_to_app, color: Colors.red),
          title: const Text(
            'Log out',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
