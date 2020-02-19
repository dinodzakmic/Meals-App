import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';
import './../widgets/main_drawer.dart';
import './../models/meal.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  final List<MealClient> favoriteMeals;
  const TabsScreen({this.favoriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    this._pages = [
      CategoriesScreen(),
      FavoritesScreen(
        favoriteMeals: widget.favoriteMeals,
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Delischz'),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black38,
          selectedItemColor: Colors.black,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
