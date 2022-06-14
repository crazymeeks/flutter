import 'package:flutter/material.dart';

import '../screens/cateogory_meals_screen.dart';

class CategoryItem extends StatelessWidget{
  
  final String id;
  final String title;
  final Color color;
  final double borderRadius = 15;

  CategoryItem(this.id, this.title, this.color);


  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
             .pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context){

    return InkWell( // Inkwell is also a GestureDetector
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

}