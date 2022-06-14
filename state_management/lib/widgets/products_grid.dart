import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/products_provider.dart';



class ProductsGrid extends StatelessWidget {


  const ProductsGrid({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // listener
    final productData = Provider.of<ProductsProvider>(context);
    final products = productData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          // create: (ctx) => products[i], create prop will cause bug once there are more products in the widget(grid)
          value: products[i], // .value makes sure that the provider works even if data changes for the widget and since we are reusing a product object(products[i])
          child: const ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // amount of columns
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), // Set certain amount of grid items on the screen
      );
  }
}