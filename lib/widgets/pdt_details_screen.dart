import 'package:blog_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/models/cart.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(loadedPdt.imgUrl),
                )
              ),
              Text(
                'Price : \$${loadedPdt.price}',style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(loadedPdt.description,style: TextStyle(
                  fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          cart.addItem(productId, loadedPdt.name, loadedPdt.price);
        },
        child: Icon(Icons.shopping_cart,size: 30,),
      ),
    );
  }
}
