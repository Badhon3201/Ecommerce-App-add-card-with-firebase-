import 'package:blog_app/screens/cart_screen.dart';
import 'package:blog_app/widgets/all_product.dart';
import 'package:blog_app/widgets/category.dart';
import 'package:blog_app/widgets/home_body.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Flutter E-com'),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
            Navigator.of(context).pushNamed(CartScreen.routeName);
          })
        ],
      ),
      body: HomeBody(),
    );
  }
}
