import 'package:flutter/material.dart';

import './drawer_item.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                height: 150,
              ),
              Positioned(
                child: Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).textTheme.title.color,
                  ),
                ),
                bottom: 25,
                left: 50,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          DrawerItem(iconData: Icons.restaurant, titleText: 'Meals'),
          DrawerItem(iconData: Icons.settings, titleText: 'Settings'),
        ],
      ),
    );
  }
}
