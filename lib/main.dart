import 'package:blog_app/screens/cart_screen.dart';
import 'package:blog_app/screens/home.dart';
import 'package:blog_app/widgets/pdt_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/order.dart';
import 'models/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter E-commerce App',
        theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.white),
        home: Home(),
        routes: {
          DetailsPage.routeName:(ctx)=>DetailsPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

/*void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Product(),
        )
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.white,
      ),
      home: Home(),
  ),
    ));
}
*/