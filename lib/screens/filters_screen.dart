import 'package:flutter/material.dart';

import './../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  SwitchListTile buildSwitchListTile(
      {String titleText,
      String subtitleText,
      bool initialValue,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(titleText),
      subtitle: Text(subtitleText),
      value: initialValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    titleText: 'Gluten-Free',
                    subtitleText: 'Only include gluten-free meals.',
                    initialValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    titleText: 'Lactose-Free',
                    subtitleText: 'Only include lactose-free meals.',
                    initialValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    titleText: 'Vegan',
                    subtitleText: 'Only include vegan meals.',
                    initialValue: _vegan,
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                buildSwitchListTile(
                    titleText: 'Vegetarian',
                    subtitleText: 'Only include vegetarian meals.',
                    initialValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
