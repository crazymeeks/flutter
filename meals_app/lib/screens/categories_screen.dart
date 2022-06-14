import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((catData){
              return CategoryItem(catData.id, catData.title, catData.color);
            }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, // max width of the grid
            childAspectRatio: 3 / 2, // define how items should be size regarding their height and width(for 200 width, we want 300 height)
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )
        );
  }
}