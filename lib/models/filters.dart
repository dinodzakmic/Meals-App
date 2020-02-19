class Filters {
  bool showGlutenFree = true;
  bool showLactoseFree = true;
  bool showVegan = true;
  bool showVegetarian = true;

  updateFilter(
      {bool glutenFree, bool lactoseFree, bool vegan, bool vegetarian}) {
    showGlutenFree = glutenFree;
    showLactoseFree = lactoseFree;
    showVegan = vegan;
    showVegetarian = vegetarian;
  }

  checkIfShowAll() {
    return showGlutenFree && showLactoseFree && showVegan && showVegetarian;
  }

  resetFilters() {
    showGlutenFree = true;
    showLactoseFree = true;
    showVegan = true;
    showVegetarian = true;
  }
}
