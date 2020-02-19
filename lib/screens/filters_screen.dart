import 'package:flutter/material.dart';

import './../widgets/main_drawer.dart';
import './../models/filters.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Filters filters;
  final Function saveFilters;

  const FiltersScreen({this.filters, this.saveFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = true;
  bool _vegetarian = true;
  bool _vegan = true;
  bool _lactoseFree = true;

  @override
  void initState() {
    _glutenFree = widget.filters.showGlutenFree;
    _lactoseFree = widget.filters.showLactoseFree;
    _vegan = widget.filters.showVegan;
    _vegetarian = widget.filters.showVegetarian;

    super.initState();
  }

  initializeFilterSaving() {
    Filters newFilters = Filters();
    newFilters.updateFilter(
        glutenFree: _glutenFree,
        lactoseFree: _lactoseFree,
        vegan: _vegan,
        vegetarian: _vegetarian);

    widget.saveFilters(newFilters);
  }

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
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.save),
            onPressed: () {
              initializeFilterSaving();

              // final snackbar = SnackBar(
              //   content: Text('Filter is saved!'),
              // );
              // Scaffold.of(context).showSnackBar(snackbar);
            },
          )
        ],
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
                    subtitleText: 'Include gluten-free meals.',
                    initialValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    titleText: 'Lactose-Free',
                    subtitleText: 'Include lactose-free meals.',
                    initialValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                buildSwitchListTile(
                    titleText: 'Vegan',
                    subtitleText: 'Include vegan meals.',
                    initialValue: _vegan,
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                buildSwitchListTile(
                    titleText: 'Vegetarian',
                    subtitleText: 'Include vegetarian meals.',
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
