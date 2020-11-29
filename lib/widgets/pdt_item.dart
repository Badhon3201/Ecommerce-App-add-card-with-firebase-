import 'package:blog_app/models/cart.dart';
import 'package:blog_app/models/products.dart';
import 'package:blog_app/widgets/pdt_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  PdtItem({this.name,this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DetailsPage.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child:Image.network(imageUrl),

          footer: GridTileBar(
            title: Text(name),
            trailing: IconButton(
              icon : Icon(Icons.shopping_cart),
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Item Added to cart'),
                  duration: Duration(seconds: 3),
                ));
                cart.addItem(pdt.id, pdt.name, pdt.price);
              },
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
