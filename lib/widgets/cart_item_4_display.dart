import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem4Display extends StatelessWidget {
  final CartItem ci;
  final String productId;

  CartItem4Display(@required this.ci, @required this.productId);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(ci.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  child: Text('\$${ci.price}'),
                ),
              ),
            ),
            title: Text(ci.title),
            subtitle: Text('Total: \$${(ci.price * ci.quantity)}'),
            trailing: Text('${ci.quantity} x'),
          ),
        ),
      ),
    );
  }
}
