import 'package:blog_app/models/cart.dart';
import 'package:blog_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx,i)=>CartPdt(
                id: cart.items.toString()[i],
                productId: cart.items.keys.toList()[i],
                name: cart.items.values.toList()[i].name,
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
              )
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: (){},
              child: Text(
                'Checkout',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.teal
              ),
              ),
            ),
          )*/
          CheckoutButton(cart: cart,),
        ],
      ),
    );
  }
}
class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({Key key, this.cart}) : super(key: key);
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Checkout'),
      onPressed: widget.cart.totalAmount <= 0 ? null : ()async{
        await Provider.of<Orders>(context,listen: false).addOrder(
          widget.cart.items.values.toList(),widget.cart.totalAmount
        );
        widget.cart.clear();
      },
    );
  }
}
