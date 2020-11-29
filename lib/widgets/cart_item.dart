import 'package:blog_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  CartPdt({this.id,this.productId,this.price,this.quantity,this.name});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.startToEnd,
      background: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete,color: Colors.white,),
        ),
        color: Colors.red,
      ),
      onDismissed: (direction){
        Provider.of<Cart>(context).removeItem(productId);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('\$${price}'),
          ),
          title: Text(name),
          subtitle: Text('Price: \$${price*quantity}'),
          trailing: Text('${quantity} x'),
        ),
      ),
    );
  }
}
