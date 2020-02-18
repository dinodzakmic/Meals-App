import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData iconData;
  final String titleText;
  final Function selected;

  const DrawerItem({this.iconData, this.titleText, this.selected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: selected,
    );
  }
}
