import 'package:flutter/material.dart';

class DrawerButtonTile extends StatelessWidget {
  final String navigation;
  final String navigationName;

  const DrawerButtonTile({
    Key? key,
    required this.navigation,
    required this.navigationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, navigation);
        print("Test for Drawer");
      },
      leading: Text(navigationName),
      shape: const Border(bottom: BorderSide(), top: BorderSide()),
    );
  }
}