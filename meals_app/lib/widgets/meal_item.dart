import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  
  // final Function removeItem;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  void selectedMeal(BuildContext context) {
    Navigator.of(context)
             .pushNamed(MealDetailScreen.routeName, arguments: id)
             .then((mealId) {
               // this then() function will just execute
               // once the page has been popped.
               // @see meal_detail_screen.dart floatingActionButton
              //  if (mealId != null) {
              //    removeItem(mealId);
              //  }
             });
  }

  String get complexityText {
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affodabilityText {
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
           children: <Widget>[
             Stack(
               children: <Widget>[
                 ClipRRect(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(15),
                     topRight: Radius.circular(15)
                   ),
                   child: Image.network(
                     imageUrl,
                     height: 250,
                     width: double.infinity,
                     fit: BoxFit.cover,
                    ),
                 ),
                 Positioned(
                   bottom: 20,
                   right: 10,
                   child: Container(
                            width: 350,
                            color: Colors.black54,
                            child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        )
                 )
               ],
             ),
             Padding(
               padding: EdgeInsets.all(20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Icon(Icons.schedule),
                       SizedBox(width: 6),
                       Text('$duration min')
                     ],
                   ),
                   Row(
                     children: <Widget>[
                       Icon(Icons.work),
                       SizedBox(width: 6),
                       Text(complexityText)
                     ],
                   ),
                   Row(
                     children: <Widget>[
                       Icon(Icons.attach_money),
                       SizedBox(width: 6),
                       Text(affodabilityText)
                     ],
                   )
                 ],
               ),
             )
           ]
        ),
      ),
    );

  }
}