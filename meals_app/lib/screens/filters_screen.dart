import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> _currentFilters;
  final Function _saveFilters;

  FiltersScreen(this._currentFilters, this._saveFilters);

  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState(){
    super.initState();

    final filters = widget._currentFilters;
    _glutenFree = filters['gluten'];
    _vegetarian = filters['vegetarian'];
    _vegan = filters['vegan'];
    _lactoseFree = filters['lactose'];

  }


  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue
  ) {
    return SwitchListTile(
                  title: Text(title),
                  value: currentValue,
                  subtitle: Text(description),
                  onChanged: updateValue,
                );
  }

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(onPressed: () {
            widget._saveFilters(
              {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              }
            );
          }, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newValue){
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Lactose-free', 'Only include lactose-free meals', _lactoseFree, (newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegetarian food', 'Only include vegetarian meals', _vegetarian, (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),

                _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan, (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}