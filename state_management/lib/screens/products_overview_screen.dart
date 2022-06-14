import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatelessWidget {

  const ProductsOverviewScreen({
    Key key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductsProvider>(context);
    final products = productProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorites,),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,)
            ])
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
