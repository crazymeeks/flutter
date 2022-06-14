import 'package:flutter/material.dart';

import '../models/meal.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
  
}

class _TabsScreenState extends State<TabsScreen> {


  List<Map<String, Object>> _pages;

  int selectedPageIndex = 0;


  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites'
      },
    ];
  }

  void _selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Favorites'))
        ],
      ),
    );


    /*return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'Categories',),
              Tab(icon: Icon(Icons.star), text: 'Favorites',)
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(), FavoritesScreen()
        ],),
      )
    );*/
  }
}