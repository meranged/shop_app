import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                onSelected: (FilterOptions selecedValue) {
                  setState(() {
                    if (selecedValue == FilterOptions.Favorites) {
                      _showOnlyFavorites = true;
                      //productsContainer.showFavoritesOnly();
                    } else {
                      _showOnlyFavorites = false;
                      //productsContainer.showAll();
                    }
                  });
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show all'),
                        value: FilterOptions.All,
                      ),
                    ]),
            Consumer<Cart>(
              builder: ((context, cart, ch) => Badge(
                    child: ch,
                    value: cart.itemCount.toString(),
                  )),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
