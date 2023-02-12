import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final Product p;

  // ProductItem(this.p);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Product>(context, listen: false);
    final c = Provider.of<Cart>(context, listen: false);
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
            leading: Consumer<Product>(
              builder: (context, p, child) => IconButton(
                icon: p.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  p.toggleFavoriteStatus();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {
                c.addItem(p.id, p.price, p.title);
              },
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
