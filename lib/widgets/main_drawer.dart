import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './../screens/filters_screen.dart';
import './../screens/tabs_screen.dart';
import './drawer_item.dart';

class MainDrawer extends StatelessWidget {
  openHome(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(TabsScreen.routeName);
  }

  openFilters(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(FiltersScreen.routeName);
  }

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
          DrawerItem(
            iconData: Icons.restaurant,
            titleText: 'Meals',
            selectedHandler: () {
              openHome(context);
            },
          ),
          DrawerItem(
            iconData: Icons.settings,
            titleText: 'Settings',
            selectedHandler: () {
              openFilters(context);
            },
          )
        ],
      ),
    );
  }
}
