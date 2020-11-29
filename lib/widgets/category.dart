import 'package:blog_app/widgets/category_cart.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(
            icon: Icon(Icons.book,size: 40,),
            name: 'Book',
          ),
          CategoryCard(
            icon: Icon(Icons.laptop,size: 40,),
            name: 'Laptop',
          ),
          CategoryCard(
            icon: Icon(Icons.videogame_asset,size: 40,),
            name: 'Game',
          ),
          CategoryCard(
            icon: Icon(Icons.mobile_screen_share,size: 40,),
            name: 'Mobile',
          ),
          CategoryCard(
            icon: Icon(Icons.watch,size: 40,),
            name: 'Watches',
          ),
          CategoryCard(
            icon: Icon(Icons.weekend,size: 40,),
            name: 'Furniture',
          ),
        ],
      ),
    );
  }
}
