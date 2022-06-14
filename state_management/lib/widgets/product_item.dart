import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({
    Key key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // final product = Provider.of<Product>(context);

    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          )
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: (){
              product.toggleFavoriteStatus();
            },
          ),
          backgroundColor: Colors.black87,
          title: Text(product.title, textAlign: TextAlign.center,),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: (){},
          ),
        ),
      )
    ),
    );
  }
}