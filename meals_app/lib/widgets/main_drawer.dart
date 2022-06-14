import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
            leading: Icon(icon, size: 26,),
            title: Text(text, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),),
            onTap: tapHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking up!', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).primaryColor),),
          ),
          SizedBox(height: 20,),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}