import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product p;

  ProductItem(this.p);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: p);
          },
          child: Image.network(
            p.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            backgroundColor: Colors.black87,
            title: Text(
              p.title,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
