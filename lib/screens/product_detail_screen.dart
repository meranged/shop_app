import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  // final Product p;

  // ProductDetailScreen(this.p);

  @override
  Widget build(BuildContext context) {
    final p = ModalRoute.of(context).settings.arguments as Product;
    final pr = Provider.of<Products>(
      context,
      listen: false,
    ).findById(p.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(pr.title),
      ),
    );
  }
}
