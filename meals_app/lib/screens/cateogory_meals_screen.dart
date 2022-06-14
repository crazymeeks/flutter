import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';
  
  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();

}

class _CategoryMealsScreenState extends State<CategoryMealsScreen>{

  String categoryTitle;
  List<Meal> displayedMeals;
  var _isLoadedData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  if (!_isLoadedData) {
    // extract route arguments
    // @see category_item.dart
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _isLoadedData = true;
  }

    
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(id: displayedMeals[index].id, title: displayedMeals[index].title, imageUrl: displayedMeals[index].imageUrl, duration: displayedMeals[index].duration, complexity: displayedMeals[index].complexity, affordability: displayedMeals[index].affordability);
          },
          itemCount: displayedMeals.length,
        ),
    );
  }
}